From: Johannes von Loewis <johannes@v.loewis.de>
Subject: Re: PST tables and Sonys Bios
Date: Sun, 20 Jul 2003 18:58:09 +0200
Sender: cpufreq-admin@www.linux.org.uk
Message-ID: <20030720165809.GA3019@zaphod.loewis.de>
References: <3F1650C3.1030903@searchbroker.de> <1058458508.bd23a8ad4d31b@carlthompson.net>
Reply-To: johannes@v.loewis.de
Mime-Version: 1.0
Return-path: <cpufreq-admin@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <1058458508.bd23a8ad4d31b@carlthompson.net>
Errors-To: cpufreq-admin@www.linux.org.uk
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Id: <cpufreq.vger.kernel.org>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq/>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Cpufreq@www.linux.org.uk

On Thu, Jul 17, 2003 at 09:15:08AM -0700, Carl Thompson wrote:
> Fact 3: that BIOS update supposedly fixes several lockup problems due to
> "system conflicts" according to the docs.
> 
> Conclusion: my guess is that Sony purposely bumped up the voltage for _some_
> CPUs because they were having system stability problems related to voltage
> scaling with them.  It's possible that the PSTs are like this to actually
> get your machine to run properly.
>
> You might want to consider that the PST as it is in the BIOS might be
> required to keep your machine from locking up occasionally.  Also rememeber

My machine (Sony Vaio FX805, Linux 2.4.2[01]+acpi+swsusp+cpufreq) locks
up occasionally. The BIOS PST is a "new one" with the voltage of 1.3V
for all frequencies. I have not yet found out, what the reason(s) for
the lock-ups is/are. Is it a problem with the standard kernel, a problem
with one of the patches, or a problem with the softmodem driver
hsflinmodem-5.03.whatever? Unfortunately, the BIOS PST is not sufficient
to keep the machine from locking up;-)

> that with those PSTs CPUFreq will still scale the CPU speed and save you
> power, it just won't scale voltage too.  Maybe getting the extra few
> minutes of battery power that scaling the voltage might give you isn't
> worth the hassle?

On my laptop the effect of scaling only the frequency is not sufficient
to keep the CPU fan from occasionally turning on. I have the hope to get
the machine quiet (for low-load situations as text editing or mp3
playing) by scaling the voltage too. 

Therefore it seems desirable to me to have a means to override the BIOS
PST in order to test upto what voltage the machine does not lock up much
more often than with 1.3V.

Regards

Johannes
