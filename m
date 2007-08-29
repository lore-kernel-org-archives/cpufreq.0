From: =?ISO-8859-2?Q?Rafa=B3_Bilski?= <rafalbilski@interia.pl>
Subject: Re: VIA C3 'Ezra-T' [C5M] - longhaul - do nothing
Date: Wed, 29 Aug 2007 19:36:15 +0200
Message-ID: <46D5AE8F.2080209@interia.pl>
References: <9f90e8bf0708280759x6068ae15j9f24e654307a3037@mail.gmail.com>	
	<46D4433A.7000509@interia.pl>	
	<9f90e8bf0708281101q19afb3ableb3589b7c363759c@mail.gmail.com>	
	<46D46CC2.6080405@interia.pl>	
	<9f90e8bf0708281314v28f29cb3o8e68a3b77701e656@mail.gmail.com>	
	<46D5000D.7010503@interia.pl>
	<9f90e8bf0708290624m592290a0v6ae9d76b7d4d19a0@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <9f90e8bf0708290624m592290a0v6ae9d76b7d4d19a0@mail.gmail.com>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "Herbert G. Fischer" <herbert.fischer@gmail.com>
Cc: cpufreq@lists.linux.org.uk

> Here is the output after:
> 
> # modprobe longhaul
> # cpufreq-info
> # cpufreq-set -f399
> # cpufreq-set -gpowersave
> # cpufreq-info
Thanks. Can You try the same for longhaul with "scale_voltage" 
module option set to "1"?
> cpufreq-core: trying to register driver longhaul
> cpufreq-core: adding CPU 0
> longhaul: VIA C3 'Ezra-T' [C5M] CPU detected.  Powersaver supported.
> longhaul: Using northbridge support.
> longhaul: MinMult:3.0x MaxMult:7.5x
> longhaul: FSB:133MHz  Lowest speed: 399MHz   Highest speed:399MHz
Weird bug, but can wait. Seems to be present in print_speed().
> freq-table: table entry 0: 399000 kHz, 1 index
> [...]
> freq-table: target is 0 (399000 kHz, 1)
> cpufreq-core: notification 0 of frequency transition to 399000 kHz
> userspace: saving cpu_cur_freq of cpu 0 to be 399000 kHz
> longhaul: Setting to FSB:133MHz Mult:3.0x (399MHz)
> cpufreq-core: notification 1 of frequency transition to 997000 kHz
> userspace: saving cpu_cur_freq of cpu 0 to be 997000 kHz
In this moment I don't know if it is unsuccessfull frequency 
transition or problem with hardware. Maybe bits in EBL_CR_POWERON 
registers are stuck. Can You benchmark (any program You like) 
how fast Your CPU is after reboot and before modprobing longhaul? 
And compare it with results after modprobing longhaul and setting 
governor to "powersave"?


----------------------------------------------------------------------
Gorace i zmyslowe (tylko dla doroslych)

>>>http://link.interia.pl/f1b13
