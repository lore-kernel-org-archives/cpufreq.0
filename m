From: Johan Bilien <jobi@via.ecp.fr>
Subject: Re: cpufreq and P3 speedstep with 2.6.0-test3 kernel
Date: Wed, 13 Aug 2003 16:56:32 +0200
Sender: cpufreq-admin@www.linux.org.uk
Message-ID: <20030813145631.GA28850@via.ecp.fr>
References: <20030813135836.GA28615@via.ecp.fr> <20030813140443.GE1372@poupinou.org> <20030813141141.GB28615@via.ecp.fr> <20030813143221.GF1372@poupinou.org>
Mime-Version: 1.0
Return-path: <cpufreq-admin@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20030813143221.GF1372@poupinou.org>
Errors-To: cpufreq-admin@www.linux.org.uk
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Id: <cpufreq.vger.kernel.org>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq/>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@www.linux.org.uk

On Wed, Aug 13, 2003, Ducrot Bruno wrote:
> Could you please read http://www.poupinou.org/cpufreq/
> and:
> 
> ftp://ftp.poupinou.org/cpufreq/speedstep-detect.tar.gz
> 
> then give me output of ./speedstep-detect
> both on battery and ac ?

on AC:

dmi_scan: return:
DMI 2.3 present.
46 structures occupying 1585 bytes.
DMI table at 0x07FF0000.
BIOS Vendor: IBM
BIOS Version: 16ET27WW (1.07 )
BIOS Release: 09/19/2001
System Vendor: IBM
Product Name: 26474EG
Version: Not Available
Board Vendor: IBM
Board Name: 26474EG
Board Version: Not Available
Trying Intel's int15 GSIC:
BIOS support GSIC call:
	signature: GSIC
	command port = 0x00b2
	command =      0x0082
	event port =   0x00c000b3
	flags =        0x07d00000
probing chipsets: Found PIIX4
  pmbase at 0x1000
Dumping PM IO register for this southbridge:
PMCNTRL (0x1004): 0x1400
(0x1006):         0x0000
GPEN (0x100e):    0x0201
PCNTRL (0x1010):  0x00000200
(0x1016):         0x0000
DEVSTS (0x101c):  0x00000000
GLBLEN (0x1020):  0x0501
(0x1022):         0x00000000
GLBCTL (0x1028):  0x06019705
DEVCTL (0x102c):  0x00000000
GPIs: (0x1030):   0x070862
(0x1033):         0x00
GPOs: (0x1034):   0x7f7786fe
(0x1038):         0x62 0x08 0x07 0x00 0xfe 0x86 0x77 0x7f 


You need to boot on AC and battery and see if GPOs change.
Then, see if one bit change in between, you have then to note the number
of this bit.  This will be the gpo_hilo= number kernel option for
enabling the speedstep-piix4 module under Linux.
                                      ..28..24..20..16..12...8...4...0
        GPOs: (0x1034):   0x7f7786fe  01111111011101111000011011111110

on battery:

dmi_scan: return:
DMI 2.3 present.
46 structures occupying 1585 bytes.
DMI table at 0x07FF0000.
BIOS Vendor: IBM
BIOS Version: 16ET27WW (1.07 )
BIOS Release: 09/19/2001
System Vendor: IBM
Product Name: 26474EG
Version: Not Available
Board Vendor: IBM
Board Name: 26474EG
Board Version: Not Available
Trying Intel's int15 GSIC:
BIOS support GSIC call:
	signature: GSIC
	command port = 0x00b2
	command =      0x0082
	event port =   0x00c000b3
	flags =        0x07d00000
probing chipsets: Found PIIX4
  pmbase at 0x1000
Dumping PM IO register for this southbridge:
PMCNTRL (0x1004): 0x1400
(0x1006):         0x0000
GPEN (0x100e):    0x0201
PCNTRL (0x1010):  0x00002200
(0x1016):         0x0000
DEVSTS (0x101c):  0x00000000
GLBLEN (0x1020):  0x0501
(0x1022):         0x00000000
GLBCTL (0x1028):  0x06010305
DEVCTL (0x102c):  0x00000000
GPIs: (0x1030):   0x070862
(0x1033):         0x00
GPOs: (0x1034):   0x7f7786fe
(0x1038):         0x62 0x08 0x07 0x00 0xfe 0x86 0x77 0x7f 


You need to boot on AC and battery and see if GPOs change.
Then, see if one bit change in between, you have then to note the number
of this bit.  This will be the gpo_hilo= number kernel option for
enabling the speedstep-piix4 module under Linux.
                                      ..28..24..20..16..12...8...4...0
        GPOs: (0x1034):   0x7f7786fe  01111111011101111000011011111110
> Then please could you please try:
> 
> ftp://ftp.poupinou.org/cpufreq/speedstep-piix4-260-test3.diff.bz2
> 
> via something like:
> modprobe speedstep-piix4 gpo_hilo=0

I tried this, but I get:

13/08 16:50 /usr/src/linux-2.6.0-test3# modprobe
speedstep-piix4 gpo_hilo=0
FATAL: Error inserting speedstep_piix4
(/lib/modules/2.6.0-test3/kernel/arch/i386/kernel/cpu/cpufreq/speedstep-piix4.ko):
No such device
zsh: 3871 exit 1     modprobe speedstep-piix4 gpo_hilo=0

-- 
jobi
