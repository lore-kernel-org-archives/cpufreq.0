From: Ivan Kanis <ivank@juliva.com>
Subject: Re: Pentium IIIM not recognised
Date: Mon, 22 Sep 2003 00:29:09 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <16238.9781.279364.547556@gargle.gargle.HOWL>
References: <16230.17445.337511.852664@gargle.gargle.HOWL>
	<20030916091302.GO11391@poupinou.org>
	<16230.57673.292946.375545@gargle.gargle.HOWL>
	<20030916102630.GQ11391@poupinou.org>
	<16231.25993.582976.85275@gargle.gargle.HOWL>
	<20030917085023.GY11391@poupinou.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces@www.linux.org.uk>
In-Reply-To: <20030917085023.GY11391@poupinou.org>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@www.linux.org.uk



    Bruno> For cpufreq cvs: cvs
    Bruno> -d:pserver:cvs@pubcvs.arm.linux.org.uk:/mnt/src/cvsroot co
    Bruno> -rLINUX_2_4 cpufreq
    Bruno> then: cd cpufreq ./patchin.sh /path/to/kernel

Ok I have done that on 2.4.22 and it seems to be happy at boot up:

speedstep-smi: IST_SMI: signature:0x47534943, command:0x008200b2, event:0x000000
00, perf_level:0x00000101
cpufreq: currently at high speed setting - 1000 MHz

But when I try to speed down the laptop my settings don't seem to
take:

dell:~# echo "77%77%powersave" > /proc/cpufreq 
dell:~# cat /proc/cpufreq 
          minimum CPU frequency  -  maximum CPU frequency  -  policy
CPU  0       733000 kHz ( 73 %)  -    1000000 kHz (100 %)  -  performance

I am missing something or is just not working ?

    Bruno> You may try also acpi for his idling stuff, which shall
    Bruno> save more power comsuption of the processor, and you may
    Bruno> have ability to throtte the CPU.  AFAIR, there is no
    Bruno> thermal zone in the i8k dsdt, but my memory may be wrong,
    Bruno> though.

I have played a little with the ACPI stuff but it has a bit of a
drawback. I can't hibernate my laptop anymore since it's not supported
yet. You are right that there is no thermal zone but that information
can be had with the i8k.c code.

I could do something drastic and change the CPU of this beast. What
would people recommend for a cool laptop? Cool as in temperature, of
course! Would the VIA C3 work?

Sorry for asking too many questions.

Ivan
