From: Dave Jones <davej@redhat.com>
Subject: Re: p4_clockmod broken in 2.6.16-rc? kernels
Date: Fri, 10 Mar 2006 00:47:23 -0500
Message-ID: <20060310054723.GC5600@redhat.com>
References: <88056F38E9E48644A0F562A38C64FB60077E8338@scsmsx403.amr.corp.intel.com>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <88056F38E9E48644A0F562A38C64FB60077E8338@scsmsx403.amr.corp.intel.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Pallipadi, Venkatesh" <venkatesh.pallipadi@intel.com>
Cc: cpufreq@lists.linux.org.uk, Mike Galbraith <efault@gmx.de>

On Thu, Mar 09, 2006 at 08:07:44PM -0800, Pallipadi, Venkatesh wrote:
 > 
 > Great to hear that the patch helped. I had a typo in the patch header
 > and attaching an updated patch. 
 > 
 > Dave: Please push this patch towards base. This was a bug in one of the
 > recent changes in p4-clockmod.c

Applied, thanks.  I fixed this one up by hand, but next time can you
inline the patch instead of attaching it ?

git doesn't grok MIME, so I end up having to save it seperately,
and munge it back into your mail in an editor before I can feed it to
git, turning 'a few seconds' into a 'a minute or two' to apply a patch.[1]

btw, should acpi-cpufreq/speedstep-ich also have those errata workarounds?

Thanks.

		Dave

[1] Actually this was even longer. Due to me missing chopping a MIME
mailheader, it still confused git-apply, and I scratched my head
for some time until Linus clued me in.  MIME- just say no!

-- 
http://www.codemonkey.org.uk
