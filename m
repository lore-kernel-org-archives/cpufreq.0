From: =?iso-8859-1?q?mark=20newman?= <emergant2000@yahoo.co.uk>
Subject: help using Harold Milz patch for PSB overide
Date: Sat, 21 Aug 2004 16:47:20 +0100 (BST)
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040821154720.736.qmail@web86901.mail.ukl.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@www.linux.org.uk

Hi,

I have bought an xpm 2500+ for my epox 8kmm+ matx
board.  Its in a small case and I'm trying to scale
the cpu clock to keep heat/noise/power to a minimum in
my media box

I think this is the relevant part of x86info


PowerNOW! Technology information
Available features:
        Temperature sensing diode present.
        Bus divisor control
        Voltage ID control

MSR: 0xc0010041=0x0000000000000000 : 00000000 00000000
00000000 00000000
           00000000 00000000 00000000 00000000
MSR: 0xc0010042=0x000b0b0b00160606 : 00000000 00001011
00001011 00001011
           00000000 00010110 00000110 00000110

FID changes won't happen
VID changes won't happen
Voltage ID codes: Maximum=1.450V Startup=1.450V
Currently=1.450V
Frequency ID codes: Maximum=14.0x Startup=6.0x
Currently=6.0x
Decoding BIOS PST tables (maxfid=16, startvid=b)
Connector type: Socket A (462 Pin PGA)

I have tried to apply the patch but only the first
hunk succeeds.  I then did my best to apply it
manually.  It built but...

My command line looks like this.  I dont know where 
to get my cpuid from and have omitted voltage settings

insmod
/lib/modules/2.6.7-gentoo-r12/kernel/arch/i386/kernel/cpu/cpufreq/powernow-k7.ko
mymaxfid=0x15 mynumpstates=6
myfids=0x15,0x00,0x0a,0x06,0x04,0x12 >> /usr/portage/a
insmod: error inserting
'/lib/modules/2.6.7-gentoo-r12/kernel/arch/i386/kernel/cpu/cpufreq/powernow-k7.ko':
-1 Unknown symbol in module

dmesg
powernow_k7: Unknown symbol
cpufreq_frequency_table_target
powernow_k7: Unknown symbol
cpufreq_frequency_table_get_attr
powernow_k7: Unknown symbol
cpufreq_freq_attr_scaling_available_freqs
powernow_k7: Unknown symbol
cpufreq_frequency_table_cpuinfo
powernow_k7: Unknown symbol
cpufreq_frequency_table_put_attr
powernow_k7: Unknown symbol
cpufreq_frequency_table_verify



Any help would be appreciated.  The cpu will currently
only run at 6x as I cant set the multiplier in the
bios.

Its possible I have misapplied the patch.  If anyone
could send me their patched powernow-k7.c off list
that would be a help

I understand this is at my own risk.  I figure as long
as I monitor temps I should be fairly safe.  I doubt
my board will allow changes in voltage anyway.

#Mark



	
	
		
___________________________________________________________ALL-NEW Yahoo! Messenger - all new features - even more fun!  http://uk.messenger.yahoo.com
