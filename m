From: Dominik Brodowski <linux@dominikbrodowski.net>
Subject: Re: [PATCH] If a CPU gets onlined set the governor to the one that
	is run on other CPUs
Date: Sun, 26 Nov 2006 22:04:46 -0500
Message-ID: <20061127030446.GA13127@dominikbrodowski.de>
References: <1164296237.3721.395.camel@queen.suse.de>
	<20061126222120.GB26600@redhat.com>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20061126222120.GB26600@redhat.com>
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

On Sun, Nov 26, 2006 at 05:21:20PM -0500, Dave Jones wrote:
> On Thu, Nov 23, 2006 at 04:37:17PM +0100, Thomas Renninger wrote:
>  > Hi,
>  > 
>  > I wonder whether there is any real use to allow userspace to
>  > run different governors on different CPUs?
>  > This complicates things (in kernel and userspace) and
>  > if not really needed I'd link up all
>  > sys/../cpu*/cpufreq/scaling_governor files?
> 
> I've thought about this a few times, and I agree that it's fairly pointless,
> especially with ht/multicore CPUs.  Given it doesn't really bring anything
> but added complexity for userspace, I'm inclined to agree that this
> is the direction we should take unless someone has a compelling argument?

Seconded. It was a bad idea from the beginning, and I know who is to blame
for that:

	Dominik

;)
