From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: Re: [RFC] cpufreqtools
Date: Fri, 22 Oct 2004 16:57:38 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20041022145738.GA2136@dominikbrodowski.de>
References: <20041021172227.GA24663@dominikbrodowski.de>
	<20041022143927.GE22405@poupinou.org>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20041022143927.GE22405@poupinou.org>
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
To: Bruno Ducrot <ducrot@poupinou.org>
Cc: jeremy@goop.org, cpufreq@www.linux.org.uk

On Fri, Oct 22, 2004 at 04:39:27PM +0200, Bruno Ducrot wrote:
> I think that Jeremy's work being somehow integrated into your utilities.
> I think libspeedfreq.c is a good starting point for point C at least.

Unfortunately, I can't base the suggested cpufreqtools not on Jeremy's work,
as it mixes userspace with kernelspace policies... and doesn't use
libsysfs... However, updating speedfreq to use cpufreqtools seems to be
possible and will probably lead to a code reduction in speedfreq.

Thanks,
	Dominik
