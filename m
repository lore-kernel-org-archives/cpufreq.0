From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: Re: cpufreq segfaults when network cable plugged in
Date: Mon, 12 Apr 2004 10:30:58 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040412083058.GB7785@dominikbrodowski.de>
References: <20040412004335.5995e422.thecoop@runbox.com>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20040412004335.5995e422.thecoop@runbox.com>
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
Content-Transfer-Encoding: 7bit
To: Simon Cooper <thecoop@runbox.com>
Cc: cpufreq@www.linux.org.uk

On Mon, Apr 12, 2004 at 12:43:35AM +0100, Simon Cooper wrote:
> right, this is very strange, cpufreq (compiled into the kernel) segfaults
> whenever the network cable on my laptop is plugged in on bootup but boots
> ok when it is plugged in after the kernel has loaded. i can post the entire
> segfault msg but it'll need me to write it all down. driver is 'r8139'
> (1000Mbps card), kernel version 2.6.5-mm2

Hm, this is really very strange. 

Which cpufreq drivers do you use / are compiled into the kernel?
What are the last two to four functions called, where's the EIP at
the segfault? [the first few function names mentioned in the oops]

Thanks,
	Dominik
