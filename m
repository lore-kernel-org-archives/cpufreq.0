From: Petr Konecny <konecny@gmail.com>
Subject: longhaul in 2.6.9 hangs VIA EPIA MII12000 when switching frequencies
Date: Sun, 5 Dec 2004 16:42:54 -0800
Message-ID: <e256efa404120516422cb37625@mail.gmail.com>
Reply-To: petr@konecny.cc
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
Sender: cpufreq-bounces@www.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@www.linux.org.uk
Cc: davej@codemonkey.org.uk

Hi,

the following script hangs my EPIA MII12000 within 5 seconds:
echo userspace >  /sys/devices/system/cpu/cpu0/scaling_governor
while true
do
   echo 532000 > /sys/devices/system/cpu/cpu0/cpufreq
   echo 1197000 >  /sys/devices/system/cpu/cpu0/cpufreq
done

When I run powernowd the system also crashes, usually when the
CPU/disk load changes often. Unfortunately this machine is headless so
I have no oops. Even netconsole is silent.

scaling_available_frequencies:
532000 1197000 598000 731000 798000 931000 1064000 665000 864000
997000 1130000 1197000

The motherboard has 1.2 GHz VIA Nehemiah CPU, cpu family 6, stepping 9. 
Loading longhaul prints:
longhaul: VIA C3 'Nehemiah C' [C5N] CPU detected.  Powersaver supported.

I can do more tests upon request. Would compiling with debugging
reveal any secrets ?
                                                           
Thanks, Petr
