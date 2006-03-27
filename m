From: Dominik Brodowski <linux@dominikbrodowski.net>
Subject: Re: [git pull] cpufreq governor updates for 2.6.17
Date: Mon, 27 Mar 2006 23:06:09 +0200
Message-ID: <20060327210609.GA23471@isilmar.linta.de>
References: <20060326095338.GA17358@dominikbrodowski.de>
	<20060327195310.GA647@redhat.com>
	<20060326095338.GA17358@dominikbrodowski.de>
	<20060327195310.GA647@redhat.com> <20060327195810.GB647@redhat.com>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20060327195310.GA647@redhat.com>
	<20060327195810.GB647@redhat.com>
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
To: Dave Jones <davej@redhat.com>
Cc: cpufreq@lists.linux.org.uk

On Mon, Mar 27, 2006 at 02:58:10PM -0500, Dave Jones wrote:
> On Mon, Mar 27, 2006 at 02:53:10PM -0500, Dave Jones wrote:
>  > On Sun, Mar 26, 2006 at 11:53:39AM +0200, Dominik Brodowski wrote:
>  >  > Hi Dave,
>  >  > 
>  >  > Please pull from
>  >  > git://git.kernel.org/pub/scm/linux/kernel/git/brodo/cpufreq-2.6.git/ 
>  >  > for a few cpufreq updates for 2.6.17. The diffstat and list of changes
>  >  > follows, the patches will be sent out as individual mails as replies to this
>  >  > message.
>  > 
>  > I'm not entirely sure what happened here.
>  > I git pull'd from this, and ended up with a 59,886 line delta against Linus' tree.
>  > As you sent the diffs too, I'll just apply-mbox them.
> 
> pilot-error on my part, the pull succeeded.

In fact, it was my mistake, as I cloned a copy of Linus' tree, checked that
you didn't have anything new in your cpufreq tree since Linus' last pull, but
forgot to reset my cpufreq tree to the HEAD of your cpufreq tree... Sorry
about that,

	Dominik
