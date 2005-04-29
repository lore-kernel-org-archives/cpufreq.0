From: Dave Jones <davej@redhat.com>
Subject: Re: Merging status.
Date: Thu, 28 Apr 2005 20:12:24 -0400
Message-ID: <20050429001224.GE1730@redhat.com>
References: <20050428203740.GE8514@redhat.com>
	<20050428144540.62936aa8.akpm@osdl.org>
	<20050428221329.GD15706@redhat.com>
	<20050428154033.248b5087.akpm@osdl.org>
	<20050428235051.GC1730@redhat.com>
	<20050428170949.4086ec86.akpm@osdl.org>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20050428170949.4086ec86.akpm@osdl.org>
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
Content-Transfer-Encoding: 7bit
To: Andrew Morton <akpm@osdl.org>
Cc: cpufreq@lists.linux.org.uk

On Thu, Apr 28, 2005 at 05:09:49PM -0700, Andrew Morton wrote:
 > Dave Jones <davej@redhat.com> wrote:
 > >
 > >  > For some bizarre reason, your http server manages to break wget.
 > >  > 
 > >  > 	wget -r http://www.codemonkey.org.uk/projects/cpufreq/pending-patches
 > >  > 
 > >  > doesn't fetch the patches.  Confused.
 > > 
 > > Fixed.
 > 
 > What was the cause?
 > 
 > (I might stick with lftp anyway - seems quicker, is less noisy and `wget
 > -r' has a habit of wanting to fetch the entire internet).

shonky robots.txt
wget has a handy -np option btw to stop it recursing past the parent
and doing stupid things.

		Dave
