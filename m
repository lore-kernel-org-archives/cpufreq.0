From: Dominik Brodowski <linux@brodo.de>
Subject: Re: calling cpufreq_set
Date: Wed, 5 Nov 2003 15:29:13 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20031105142913.GA19764@brodo.de>
References: <3FA839CD.3070404@buettcher.org>
Mime-Version: 1.0
Return-path: <cpufreq-bounces@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <3FA839CD.3070404@buettcher.org>
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
Content-Transfer-Encoding: 7bit
To: Stefan Buettcher <stefan@buettcher.org>
Cc: cpufreq ML <cpufreq@www.linux.org.uk>

Hi Stefan,

On Wed, Nov 05, 2003 at 12:44:13AM +0100, Stefan Buettcher wrote:
> Hi,
> 
> I am new to this list as well as cpufreq at all.
> 
> I have written a kernel module (2.4.19-something) on the
> ipaq 5400. This module makes direct calls to cpufreq_set.
> While the system does not break, the usb does. usbnet
> suddenly stops working and will resist my efforts to work
> afterwards.
> 
> When I do not do the calls from within the kernel but use
> the proc file interface provided by cpufreq, the system is
> stable and usb has no problems.
> 
> Has anyone experienced similar problems? Any idea why
> this happens?

I'm not aware of the details of the ipaq cpufreq driver - it's neither in
the kernel sources, nor was it ever posted on this list... so it _might_ be
a driver- or platform-specific problem. Maybe some timing calculations are
wrong after calls to cpufreq_set, maybe there needs to be some delay between
subsequent calls to cpufreq_set, ...

Other than that, cpufreq_set() is deprecated in 2.6.

	Dominik
