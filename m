From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: Re: regression on Dell C640
Date: Mon, 22 Nov 2004 09:35:32 +0100
Message-ID: <20041122083532.GB13924@dominikbrodowski.de>
References: <20041122075807.E52743F03@latitude.mynet.no-ip.org>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20041122075807.E52743F03@latitude.mynet.no-ip.org>
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
Content-Transfer-Encoding: 7bit
To: aeriksson2@fastmail.fm
Cc: cpufreq@www.linux.org.uk

On Mon, Nov 22, 2004 at 08:58:05AM +0100, aeriksson2@fastmail.fm wrote:
> (This one didn't make it to the list, it seems. Resending...)
> 
> I folks, I just discovered a regression on Dell C640. It's somewhere
> beteween 2.6.7 and 2.6.8.1. I'm using the speedstep-ich module.
> 
> When trying to change frequency (on 2.6.9 now), no change is 
> recorded, but I get this in the log:
> 
> Nov 19 20:49:52 korven speedstep-lib: P4 - MSR_EBC_FREQUENCY_ID: 0x14300814 0x0
> Nov 19 20:49:52 korven speedstep-lib: P4 - FSB 100000 kHz; Multiplier 20
> 
> Any ideas?

Hm. Do I understand you correctly that you don't have a
/sys/devices/system/cpu/cpu0/cpufreq/ any longer, and/or that 
/sys/devices/system/cpu/cpu0/cpufreq/cpuinfo_cur_freq doesn't change any
more? If so, please test 2.6.10-rc2 and pass "cpufreq.debug=2" to the
kernel, and send me the dmesg [no need to cc the list on that]

Thanks,
	Dominik
