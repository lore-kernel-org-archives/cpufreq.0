From: Niklas Edmundsson <Niklas.Edmundsson@hpc2n.umu.se>
Subject: RE: powernow-k8: out of sync on Athlon64 x2 3800+
Date: Tue, 31 Jan 2006 16:28:05 +0100 (MET)
Message-ID: <Pine.GSO.4.64.0601311621200.14826@kleopatra.acc.umu.se>
References: <84EA05E2CA77634C82730353CBE3A84303218B5B@SAUSEXMB1.amd.com>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <84EA05E2CA77634C82730353CBE3A84303218B5B@SAUSEXMB1.amd.com>
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
To: "Langsdorf, Mark" <mark.langsdorf@amd.com>
Cc: cpufreq@lists.linux.org.uk

On Tue, 31 Jan 2006, Langsdorf, Mark wrote:

>> Kernel: kernel.org 2.6.15.1, 32bit SMP
>> CPU: AMD Athlon(tm) 64 X2 Dual Core Processor 3800+
>> Machine: Fujitsu-Siemens ESPRIMO P5600 (SiS761), latest BIOS.
>>
>> I'm not on the list so Cc replies to me.
>
> You'll get that message on an Athlon X2 if you're using an
> old version of the driver that doesn't fully support dual
> core or if your part is being reported to Linux as 2
> single core parts.
>
> Neither of those should be happening with the 2.6.15.1 kernel.

OK, seems we've really found a bug then.

> Could you send me the results of `dmesg | grep powern`
> immediately after boot?

Sure:
# dmesg|grep powern
powernow-k8: Found 2 AMD Athlon 64 / Opteron processors (version 1.50.4)
powernow-k8:    0 : fid 0xc (2000 MHz), vid 0x8 (1350 mV)
powernow-k8:    1 : fid 0xa (1800 MHz), vid 0xa (1300 mV)
powernow-k8:    2 : fid 0x2 (1000 MHz), vid 0x12 (1100 mV)
powernow-k8:    0 : fid 0xc (2000 MHz), vid 0x8 (1350 mV)
powernow-k8:    1 : fid 0xa (1800 MHz), vid 0xa (1300 mV)
powernow-k8:    2 : fid 0x2 (1000 MHz), vid 0x12 (1100 mV)
powernow-k8: error - out of sync, fix 0xc 0x2, vid 0x8 0x12
powernow-k8: error - out of sync, fix 0x2 0xa, vid 0x12 0xa
powernow-k8: error - out of sync, fix 0xa 0xc, vid 0xa 0x8
powernow-k8: error - out of sync, fix 0xc 0x2, vid 0x8 0x12
powernow-k8: error - out of sync, fix 0x2 0xc, vid 0x12 0x8
powernow-k8: error - out of sync, fix 0xc 0x2, vid 0x8 0x12

Just ask if there's more info that you need.

/Nikke
-- 
-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
  Niklas Edmundsson, Admin @ {acc,hpc2n}.umu.se     |    nikke@hpc2n.umu.se
---------------------------------------------------------------------------
  Stagecoach -- Drama teacher
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
