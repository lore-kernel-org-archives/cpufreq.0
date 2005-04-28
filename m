From: Andrew Morton <akpm@osdl.org>
Subject: Re: Merging status.
Date: Thu, 28 Apr 2005 15:40:33 -0700
Message-ID: <20050428154033.248b5087.akpm@osdl.org>
References: <20050428203740.GE8514@redhat.com>
	<20050428144540.62936aa8.akpm@osdl.org>
	<20050428221329.GD15706@redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <20050428221329.GD15706@redhat.com>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
To: Dave Jones <davej@redhat.com>
Cc: cpufreq@lists.linux.org.uk

Dave Jones <davej@redhat.com> wrote:
>
> [fixed up the Cc list which I botched]
> 
> On Thu, Apr 28, 2005 at 02:45:40PM -0700, Andrew Morton wrote:
>  > Dave Jones <davej@redhat.com> wrote:
>  > >
>  > > http://www.codemonkey.org.uk/projects/cpufreq/pending-patches/
>  > > http://www.codemonkey.org.uk/projects/agp/pending-patches/
>  > 
>  > No probs.  I'm already doing that for ALSA patches.
>  > 
>  > Please make sure the patches alphasort into applying order, or, when you
>  > start using quilt (you should!), include the series file.
> 
> They're of the form CPUFREQ-nn where nn is the numerical order they
> should be applied in.

Yeah, I always found that to be a bit unweildy.  Whatever.

For some bizarre reason, your http server manages to break wget.

	wget -r http://www.codemonkey.org.uk/projects/cpufreq/pending-patches

doesn't fetch the patches.  Confused.
