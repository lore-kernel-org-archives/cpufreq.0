From: Kenneth Ho <ken.ho@theorem.ca>
Subject: Re: speedstep-piix4 don't work
Date: Tue, 08 Jul 2003 13:45:33 -0400
Sender: cpufreq-admin@www.linux.org.uk
Message-ID: <3F0B033D.3090709@theorem.ca>
References: <3F0AED86.7040500@theorem.ca> <20030708163556.GM7796@poupinou.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-admin@www.linux.org.uk>
In-Reply-To: <20030708163556.GM7796@poupinou.org>
Errors-To: cpufreq-admin@www.linux.org.uk
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Id: <cpufreq.vger.kernel.org>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Ducrot Bruno <ducrot@poupinou.org>
Cc: cpufreq@www.linux.org.uk

Ducrot Bruno wrote:

>On Tue, Jul 08, 2003 at 12:12:54PM -0400, Kenneth Ho wrote:
>  
>
>>The latest patch posted on this mailing list, against 2.4.21-ac4, 
>>doesn't work on my Thinkpad X20.
>>
>>The CPU is a Speedstep capable P3@600MHz, whose clockspeed varies from 
>>260 to 600 depending on BIOS settings and AC power (as reported during 
>>testing with speedstep-detect and bootup). speedstep-detect also catches 
>>a single bit GPO change when switching from AC to battery on boot, with 
>>BIOS settings at automatic defaults.
>>
>>GPOs changes from 0x767bbfe to 0x767fbbff after disconnecting the AC. 
>>This should be gpo_hilo=0.
>>
>>Calling modprobe speedstep-piix4 gpo_hilo=0 leaves dmesg saying cpufreq: 
>>changed failed.
>>
>>Using the old speedstep_bx module on poupinou with gpo_hilo=0 yields the 
>>following (success) output on dmesg:
>>gpo_hilo: 0x34
>>gpo_hilo_shift: 0x0
>>frequency_high: 600000
>>frequency_low: 500000
>>
>>    
>>
>
>Could you please send me the dmesg output, with SPEEDSTEP_DEBUG enabled both
>in speedstep-piix4.c and speedstep-lib.c please?
>
>Also, I would be happy to see the output of speedtep-detect
>
>Cheers,
>
>  
>
AC plugged in:
dmi_scan: return:
DMI 2.3 present.
47 structures occupying 1685 bytes.
DMI table at 0x000DC010.
BIOS Vendor: IBM
BIOS Version: IZET99WW (2.21 )
BIOS Release: 10/19/2001
System Vendor: IBM
Product Name: 266235F
Version: Not Available
Board Vendor: IBM
Board Name: 266235F
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
PMCNTRL (0x1004): 0x1401
(0x1006):         0x0000
GPEN (0x100e):    0x0a00
PCNTRL (0x1010):  0x00001200
(0x1016):         0x0000
DEVSTS (0x101c):  0x00000000
GLBLEN (0x1020):  0x0400
(0x1022):         0x00000000
GLBCTL (0x1028):  0x03011f05
DEVCTL (0x102c):  0x00200000
GPIs: (0x1030):   0x12b03a
(0x1033):         0x00
GPOs: (0x1034):   0x767fbbfe
(0x1038):         0x3a 0xb0 0x12 0x00 0xfe 0xbb 0x7f 0x76


You need to boot on AC and battery and see if GPOs change.
Then, see if one bit change in between, you have then to note the number
of this bit.  This will be the gpo_hilo= number kernel option for
enabling the speedstep-piix4 module under Linux.
                                      ..28..24..20..16..12...8...4...0
        GPOs: (0x1034):   0x767fbbfe  01110110011111111011101111111110

AC out:
dmi_scan: return:
DMI 2.3 present.
47 structures occupying 1685 bytes.
DMI table at 0x000DC010.
BIOS Vendor: IBM
BIOS Version: IZET99WW (2.21 )
BIOS Release: 10/19/2001
System Vendor: IBM
Product Name: 266235F
Version: Not Available
Board Vendor: IBM
Board Name: 266235F
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
PMCNTRL (0x1004): 0x1401
(0x1006):         0x0000
GPEN (0x100e):    0x0a00
PCNTRL (0x1010):  0x00001200
(0x1016):         0x0000
DEVSTS (0x101c):  0x00000000
GLBLEN (0x1020):  0x0400
(0x1022):         0x00000000
GLBCTL (0x1028):  0x07019705
DEVCTL (0x102c):  0x00200000
GPIs: (0x1030):   0x12b03a
(0x1033):         0x00
GPOs: (0x1034):   0x767fbbff
(0x1038):         0x3a 0xb0 0x12 0x00 0xff 0xbb 0x7f 0x76


You need to boot on AC and battery and see if GPOs change.
Then, see if one bit change in between, you have then to note the number
of this bit.  This will be the gpo_hilo= number kernel option for
enabling the speedstep-piix4 module under Linux.
                                      ..28..24..20..16..12...8...4...0
        GPOs: (0x1034):   0x767fbbff  01110110011111111011101111111111

dmesg:
cpufreq: Coppermine: MSR_IA32_EBL_CR_POWERON is 0x44080020, 0x0
cpufreq: Coppermine: MSR_IA32_PLATFORM ID is 0x0, 0x2540000
speedstep-lib: P3 - MSR_IA32_EBL_CR_POWERON: 0x44080020 0x0
speedstep-lib: P3 - MSR_IA32_EBL_CR_POWERON: 0x44080020 0x0
cntb before: 0x000000e1
cntb after:  0x000007e1
pcntrl before: 0x00001200
pcntrl after:  0x00001804
speedstep-lib: P3 - MSR_IA32_EBL_CR_POWERON: 0x44080020 0x0
cpufreq: change failed
speedstep-lib: P3 - MSR_IA32_EBL_CR_POWERON: 0x44080020 0x0
speedstep-lib: P3 - MSR_IA32_EBL_CR_POWERON: 0x44080020 0x0
cntb before: 0x000000e1
cntb after:  0x000007e1
pcntrl before: 0x00001200
pcntrl after:  0x00001804
speedstep-lib: P3 - MSR_IA32_EBL_CR_POWERON: 0x44080020 0x0
cpufreq: change failed
speedstep-lib: P3 - MSR_IA32_EBL_CR_POWERON: 0x44080020 0x0
