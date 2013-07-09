package WxNotes; use base qw(Wx::App Exporter); 
# use Class::Date qw(:errors date localdate gmdate now -DateParse -EnvC);
use strict; 
use Exporter; 
our $VERSION = 0.10;
our @EXPORT_OK = qw(
$frame $xr show_note  $currentData $xrc $CloseWin $dialog $icon %txtctrl 
 ) ; 
#use Wx; 
#use Wx::Grid;

use Wx qw[:button :textctrl :statictext :menu :sizer :misc :frame
          wxDefaultPosition
          wxDefaultSize
          wxDefaultValidator
          wxDEFAULT_DIALOG_STYLE
          wxID_CLOSE
          wxID_OK
          wxOK
          wxGridSelectRows
          wxRESIZE_BORDER
          wxDP_ALLOWNONE
          wxTE_MULTILINE];


use Carp; 
our $dialog; 
our $xr; 
#our $xrc = 'res/res.xrc'; # location of resource file 
#our $xrc = '.\\res\\xrc_note1_dialog.xrc'; # location of resource file 
our $xrc = '.\\res\\view.xrc'; # location of resource file 

our $dialogID = 'MyDialog1'; # XML ID of the main frame 
   my @lclDBData;
our $CloseWin = \&CloseWin; # this is not a menu option
# it is the routine called before the end 
# it needs to Destroy() all top level dialogs 
our $icon = Wx::GetWxPerlIcon(); 
my $file; # the name of the file used in Open/Save 
sub OnInit 
{ my $app = shift; 
# 
# Load XML Resources 
# 
use Wx::XRC; 
$xr = Wx::XmlResource->new(); 
$xr->InitAllHandlers(); 
croak "No Resource file $xrc" unless -e $xrc; 
$xr->Load( $xrc ); 
# 
# Load the main frame from resources 
# 
# $dialog = 'Wx::Dialog'->new(our $frame); 
croak "No dialog named $dialogID in $xrc" unless 
$dialog = $xr->LoadDialog(our $frame, $dialogID);

# debug - print " pm - dialog = $dialog \n";
# debub - print " pm - frame = $frame \n";
my ($idDelete) = FindWindowByXid('btnOK');
Wx::Event::EVT_BUTTON($dialog, $idDelete, \&OnUpdate );

my ($idCancel) = FindWindowByXid('btnCancel');
Wx::Event::EVT_BUTTON($dialog, $idCancel, sub { $_[0]->Close } );


 
# 
# Set event handlers 
# 
use Wx::Event qw(EVT_MENU EVT_CLOSE); 
# 
# Show the window 
# 
1; 
} 

sub FindWindowByXid 
{ my $id = Wx::XmlResource::GetXRCID($_[0], -2);
return undef if $id == -2; 
my $win = Wx::Window::FindWindowById($id, our $frame); 
return wantarray ? ($win, $id) : $win; 
} 

sub MsgBox 
{ use Wx qw (wxOK wxICON_EXCLAMATION); 
my @args = @_; 
$args[1] = 'Message' unless defined $args[1]; 
$args[2] = wxOK | wxICON_EXCLAMATION unless defined $args[2]; 
my $md = Wx::MessageDialog->new(our $frame, @args); 
$md->ShowModal(); 
} 
       my $found = 0;
       my $g_id;
  	   my @dbColums =          qw(Note_ID 
                                Lead_ID 
                                Note);      


sub show_note {
#    my( $self, $event, $parent ) = @_;
    my(@current) = @_;
      print "id: $current[0]\n";
    my $inID = $current[0] . ":" . $current[2] . ":"  . $current[3];
      print " inID - $inID\n";
      print "note: $current[15]\n";


#init_data();
FindWindowByXid('tcOUT')->SetValue('mmmmmmmmmmmmmmmmmmmm');


    $dialog->ShowModal();
}    
    
#    my $dialog = $self->xrc->LoadDialog( $parent || $self, 'dlg1' );
#  if ( $currentLength > 1 && $data[1] ne ".") {  $bname->ChangeValue($data[1]) } else { $bname->ChangeValue("")} ;
#   if ( $currentLength > 2 && $data[2] ne ".") {  $firstname->ChangeValue($data[2]) } else { $firstname->ChangeValue("")} ;
# $id->SetValue($inID);
# $notes->SetValue($current[15]);

#    $dialog->Destroy;
sub init_data
{
    my    $idN = FindWindowByXid('tb_id');
    my    $Notes = FindWindowByXid('tb_note');
    my $lb1 = FindWindowByXid('lb_id');
    my $lb2 = FindWindowByXid('lb_note');    
    
        $lb1->SetLabel('xx');
        $lb2->SetLabel("yy");   
    
          $idN->SetValue("abcd");
        $Notes->ChangeValue('efch');
        
        
$idN->SetValue('XXXXXXXXXXXXXXXXXXXX');
$idN->ChangeValue('cvfcvdcvd');
        
        
print " idn - $idN\n";
print " notes = $Notes\n";
        
        
}



sub OnUpdate
{
    return 1;
}

sub addnewlines
{
     my $inString = $_[0];
     my $outString;
     my $mn = 0;
     my $max = 0;
     my $strln = length $inString;
     print "length: $strln\n";
     
     while ( $max < $strln)
     {
                $outString .= substr($inString,$mn,26) . "\n";
                $mn = $mn + 26 ;
                $max = $mn;
     }
 #    print "out- $outString\n";
      return $outString; 
}

sub update_notes
{
         my (@ckarray) = @_;      
     my $dbfile = "leadmanagement.db";
     my $dbh = DBI->connect("dbi:SQLite:dbname=$dbfile","","", {});

      print " update stats - id: $g_id\n";
# 	  my $tempe = join(" = ?, ",@dbColums);
      
     my   $statement = "UPDATE Note SET Note = ? WHERE Lead_ID = ? and Note_ID = ?"; 
	                   
#        $statement = "UPDATE LeadStats SET " . $tempe . "= ?, Contact_Notes = ? WHERE statLeadLnk = ?"; 
       $dbh->do($statement, undef, $ckarray[0],  $g_id);
       $dbh->disconnect;

}

sub insert_notes
{
    
}

sub select_notes
{
    
}

sub Exit 
{ 
 print "search exit\n";
  $dialog->Close; 
} 
# 
# Close is not called by the menu, but is called to close all windows 
#         
# If there are any toplevel dialogs, close them here, otherwise the 
#               
# program will not exit. 
# 
sub CloseWin 
{ 
  print " exit - wxnotes\n";
 our $dialog->Destroy(); 
} 
1; 