From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: Re: Pentium III Coppermine
Date: Thu, 14 Oct 2004 17:23:46 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20041014152346.GA7447@dominikbrodowski.de>
References: <33222.14179-2631-1010294146-1097668908@email.seznam.cz>
	<20041013193706.A57813F03@latitude.mynet.no-ip.org>
	<200410141622.05561.hladky.jiri@seznam.cz>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <200410141622.05561.hladky.jiri@seznam.cz>
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
To: Jiri Hladky <hladky.jiri@seznam.cz>
Cc: aeriksson@fastmail.fm, cpufreq@www.linux.org.uk

On Thu, Oct 14, 2004 at 04:22:05PM +0200, Jiri Hladky wrote:
> Hi Anders,
> 
> CPU stepping under windows is working just fine, so I know that my CPU 
> supports it. 
> 
> Unfortunatelly, my speedstep-lib does not support relaxed_check option:-( So 
> neither this workaround  is working:-(

You need to enable CONFIG_X86_SPEEDSTEP_RELAXED_CAP_CHECK in your kernel config.

	Dominik
