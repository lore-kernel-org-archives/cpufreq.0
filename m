From: Philippe Fischer <philippe.fischer@consistec.de>
Subject: Another PIII Coppermine user
Date: Fri, 30 Jan 2004 16:50:16 +0100
Sender: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Message-ID: <401A7D38.5000609@consistec.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: cpufreq mailing list <cpufreq@www.linux.org.uk>

Hello all,

I've tried to get the speedstep_smi module work on my  Vaio SR21k  with  
the params
smi_port=0xb2 and smi_cmd=0x80 but I've got an error message that my 
chipset is not supported.


Speedstep_detect  generates following output :


_________________________________________________________
dmi_scan: return:
DMI 2.1 present.
27 structures occupying 891 bytes.
DMI table at 0x000F2040.
BIOS Vendor: Phoenix Technologies LTD
BIOS Version: R0208D1
BIOS Release: 01/05/01
System Vendor: Sony Corporation   
Product Name: PCG-SR21K(DE)      
Version: 01                 
Board Vendor: Sony Corporation   
Board Name: PCG-SR21K(DE)      
Board Version: 01                 
Trying Intel's int15 GSIC:
BIOS support GSIC call:
    signature: GSIC
    command port = 0x00b2
    command =      0x0080
    event port =   0x000000b3
    flags =        0x07d00100
probing chipsets: Found PIIX4
  pmbase at 0x8000
Dumping PM IO register for this southbridge:
PMCNTRL (0x8004): 0x1403
(0x8006):         0x0000
GPEN (0x800e):    0x0f00
PCNTRL (0x8010):  0x00003204
(0x8016):         0x0000
DEVSTS (0x801c):  0x00000000
GLBLEN (0x8020):  0x0000
(0x8022):         0x00000000
GLBCTL (0x8028):  0x0301ff05
DEVCTL (0x802c):  0x01000000
GPIs: (0x8030):   0x26827b
(0x8033):         0x00
GPOs: (0x8034):   0x54bfffff
(0x8038):         0x7b 0x82 0x26 0x00 0xff 0xff 0xbf 0x54


You need to boot on AC and battery and see if GPOs change.
Then, see if one bit change in between, you have then to note the number
of this bit.  This will be the gpo_hilo= number kernel option for
enabling the speedstep-piix4 module under Linux.
                                      ..28..24..20..16..12...8...4...0
        GPOs: (0x8034):   0x54bfffff  01010100101111111111111111111111
__________________________________________________________________


Should I try the PIIX4 module? If so, where can I find it for kernel 2.6.1 ?


Best regards

Philippe
