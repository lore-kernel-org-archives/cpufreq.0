From: "H. Peter Anvin" <hpa@zytor.com>
Subject: Re: [PATCH 3/3] cpuid: switch to cpuid_on_cpu()
Date: Mon, 02 Apr 2007 16:25:42 -0700
Message-ID: <461190F6.3060108@zytor.com>
References: <20070402113947.GC6785@localhost.sw.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <20070402113947.GC6785@localhost.sw.ru>
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
To: Alexey Dobriyan <adobriyan@sw.ru>
Cc: akpm@osdl.org, davej@codemonkey.org.uk, cpufreq@lists.linux.org.uk, linux-kernel@vger.kernel.org, ak@suse.de, devel@openvz.org

Alexey Dobriyan wrote:
> Now that cpuid_on_cpu() is in core, cpuid driver can be shrinked.
> 
> Signed-off-by: Alexey Dobriyan <adobriyan@sw.ru>

Hi Alexey,

This, and your other changes in this area does conflict with the work 
that I've been doing on extending the usability of the CPUID and MSR 
drivers (which is part of why this work has dragged out seemingly forever.)

I would really appreciate it if we could work together on this; there 
needs to be new paravirtualization entry points for this.  Consequently, 
I just updated and uploaded a git tree with the current status.  It 
still needs porting to x86-64, however.

The current cpuid/msr work is at:

http://git.kernel.org/?p=linux/kernel/git/hpa/linux-2.6-cpuidmsr.git;a=summary

	-hpa
