From: John Chia <orange@geek.com>
Subject: Re: speedstep-smi module on Omnibook 6000 (2.6.0-test8)
Date: Mon, 20 Oct 2003 15:05:22 -0400
Sender: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Message-ID: <20031020190522.GA743@beefchickenpork.org>
References: <20031020010408.GA2379@beefchickenpork.org>
	<20031020164242.GB13989@poupinou.org>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20031020164242.GB13989@poupinou.org>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ducrot Bruno <ducrot@poupinou.org>
Cc: John Chia <orange@geek.com>, cpufreq@www.linux.org.uk

Sorry for the premature reply,

Here's the output of speedstep-detect under power:

dmi_scan: return:
DMI 2.3 present.
36 structures occupying 1161 bytes.
DMI table at 0x000EFC80.
BIOS Vendor: Phoenix Technologies Ltd.
BIOS Version: EA.M1.82 
BIOS Release: 05/23/2002
System Vendor: Hewlett-Packard
Product Name: HP OmniBook PC         
Version: HP OmniBook 6000 EA    
Board Vendor: Hewlett-Packard
Board Name: HP OmniBook PC         
Board Version: 6000EA
Trying Intel's int15 GSIC:
BIOS DO NOT support GSIC call.  Dumping registers anyway:
eax = 0x00008680
ebx = 0x00000000
ecx = 0x00000000
edx = 0x47534943
probing chipsets: Found PIIX4
  pmbase at 0x8000
Dumping PM IO register for this southbridge:
PMCNTRL (0x8004): 0x1400
(0x8006):         0x0000
GPEN (0x800e):    0x0001
PCNTRL (0x8010):  0x00001a08
(0x8016):         0x0000
DEVSTS (0x801c):  0x00000000
GLBLEN (0x8020):  0x0400
(0x8022):         0x00000000
GLBCTL (0x8028):  0x06013d05
DEVCTL (0x802c):  0x02000000
GPIs: (0x8030):   0x260003
(0x8033):         0x00
GPOs: (0x8034):   0x00e02150
(0x8038):         0x03 0x00 0x26 0x00 0x50 0x21 0xe0 0x00 

                                      ..28..24..20..16..12...8...4...0
        GPOs: (0x8034):   0x00e02150  00000000111000000010000101010000

And here's the diff for the battery:

26c26
< PCNTRL (0x8010):  0x00001a08
---
> PCNTRL (0x8010):  0x00023e18
29c29
< GLBLEN (0x8020):  0x0400
---
> GLBLEN (0x8020):  0x0500
35,36c35,36
< GPOs: (0x8034):   0x00e02150
< (0x8038):         0x03 0x00 0x26 0x00 0x50 0x21 0xe0 0x00 
---
> GPOs: (0x8034):   0x40e02150
> (0x8038):         0x03 0x00 0x26 0x00 0x50 0x21 0xe0 0x40 44c44
<         GPOs: (0x8034):   0x00e02150  00000000111000000010000101010000
---
>         GPOs: (0x8034):   0x40e02150  01000000111000000010000101010000

Thanks for everything,
John.
