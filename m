From: Niklas Edmundsson <Niklas.Edmundsson@hpc2n.umu.se>
Subject: powernow-k8: out of sync on Athlon64 x2 3800+
Date: Tue, 31 Jan 2006 16:00:33 +0100 (MET)
Message-ID: <Pine.GSO.4.64.0601311308390.14826@kleopatra.acc.umu.se>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=m.gmane.org+glkc-cpufreq=m.gmane.org@lists.linux.org.uk
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: cpufreq@lists.linux.org.uk


Hi all!

We're getting errors like this in the kernel log:
powernow-k8: error - out of sync, fix 0xc 0x2, vid 0x8 0x12
powernow-k8: error - out of sync, fix 0x2 0xa, vid 0x12 0xa
powernow-k8: error - out of sync, fix 0xa 0xc, vid 0xa 0x8
powernow-k8: error - out of sync, fix 0xc 0x2, vid 0x8 0x12

Looking at /proc/cpuinfo the CPU:s doesn't seem to change frequency, 
even though the sysfs cpufreq knobs says otherwise.

Is this a known problem, or is there anything we can do to help 
debug/fix it?

Kernel: kernel.org 2.6.15.1, 32bit SMP
CPU: AMD Athlon(tm) 64 X2 Dual Core Processor 3800+
Machine: Fujitsu-Siemens ESPRIMO P5600 (SiS761), latest BIOS.

I'm not on the list so Cc replies to me.

/Nikke
-- 
-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
  Niklas Edmundsson, Admin @ {acc,hpc2n}.umu.se     |    nikke@hpc2n.umu.se
---------------------------------------------------------------------------
  A bachelor is a guy who is footloose and fiancee free
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
