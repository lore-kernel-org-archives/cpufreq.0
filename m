From: Ivan Kanis <ivank@juliva.com>
Subject: Re: Pentium IIIM not recognised
Date: Mon, 22 Sep 2003 11:46:51 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <16238.50443.239826.952380@gargle.gargle.HOWL>
References: <16230.17445.337511.852664@gargle.gargle.HOWL>
	<20030916091302.GO11391@poupinou.org>
	<16230.57673.292946.375545@gargle.gargle.HOWL>
	<20030916102630.GQ11391@poupinou.org>
	<16231.25993.582976.85275@gargle.gargle.HOWL>
	<20030917085023.GY11391@poupinou.org>
	<16238.9781.279364.547556@gargle.gargle.HOWL>
	<87k781k3oy.wl%miura@da-cha.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces@www.linux.org.uk>
In-Reply-To: <87k781k3oy.wl%miura@da-cha.org>
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


    Hiroshi> That's first time I see 'perf_level' is 0x00000101.  Many
    Hiroshi> machines have 0x07d00000 or 0x07d00100.  I assumes the
    Hiroshi> bit 1 means that it is not support an event notification.
    Hiroshi> Bit 8 means it is not supports SMI function 'get_freqs'.

It sounds like it's not a very good CPU.

    Hiroshi> # echo "0:733000:1000000:powersave" > /proc/cpufreq

It works very nicely:

dell:~# bogomips 
Calibrating delay loop.. ok - 984.00 BogoMips
dell:~# echo "0:733000:1000000:powersave" > /proc/cpufreq
dell:~# bogomips 
Calibrating delay loop.. ok - 714.00 BogoMips

Thank you!

Ivan
