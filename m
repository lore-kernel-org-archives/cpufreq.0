From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: Re: speedstep-ich and ich5, [speedstep]
Date: Sat, 7 Aug 2004 15:14:32 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040807131432.GA8934@dominikbrodowski.de>
References: <4114D272.6070808@versanet.de>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <4114D272.6070808@versanet.de>
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
To: Christian Heimanns <heimanns@versanet.de>
Cc: cpufreq@www.linux.org.uk

On Sat, Aug 07, 2004 at 03:00:34PM +0200, Christian Heimanns wrote:
> I hope I make no mistake now. I started a thread with Dominik a couple 
> of weeks ago but not in this mailing list. Now I'm back from vacation 
> and will continue troubleshooting. Thanks for understanding.

Hope you had a good vacation!

> I tried this patch 
> (http://marc.theaimsgroup.com/?l=acpi4linux&m=107684287525298&w=2

Did you use the patch at that location, or the one I sent you [which is
more up to date]? If it's the latter, I might have made an error in some way
or other in "updating" the patch...

>) with 
> no success. The module won't load. I'm not sure that the mistake is 
> using kernel 2.6.8-rc3 instaed of rc2?
>
> modprobe acpi
> FATAL: Error inserting acpi 
> (/lib/modules/2.6.8-rc3-bk1/kernel/arch/i386/kernel/cpu/cpufreq/acpi.ko): 
> No such device

Just to make sure: the error doesn't appear without the patch?

	Dominik
