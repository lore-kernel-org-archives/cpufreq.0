From: Dave Jones <davej@redhat.com>
Subject: Re: [PATCH] speedstep-centrino should ignore upper performance
	control bits
Date: Wed, 8 Nov 2006 19:22:08 -0500
Message-ID: <20061109002208.GA805@redhat.com>
References: <20061106233923.GA15063@us.ibm.com>
	<20061107021441.GA10457@isilmar.linta.de>
	<200611070209.39817.len.brown@intel.com>
	<20061107184902.GA11620@us.ibm.com>
	<20061108232119.GB28012@us.ibm.com>
	<20061108232955.GL3309@redhat.com>
	<20061109000031.GD28012@us.ibm.com>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20061109000031.GD28012@us.ibm.com>
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
To: Gary Hade <garyhade@us.ibm.com>
Cc: cpufreq@lists.linux.org.uk, Dominik Brodowski <linux@dominikbrodowski.net>

On Wed, Nov 08, 2006 at 04:00:31PM -0800, Gary Hade wrote:

 > > Argh. I sat on the fence on this one until the dest settled,
 > > and now, as soon as I merge it, this happens. Bah!
 > Dave, I'm sorry.  I just discovered the problem. :(

Ok, I just tried to reconstruct my git tree without that diff
and hit problems trying to get the older patches applying against
a current tree, so I don't want to go down the route of making
everyone rediff and resend the 20 or so patches already queued.
However..

 > > Send an incremental against cpufreq.git so I don't have to
 > > reconstruct the whole git tree?  
 > Okay, I'll try to figure out how to do that.

git revert has nuked the change, but leaves a mess in the commits,
but I think we can live with that.  So just send the right fix,
and we'll make like this never happened :-)

		Dave

-- 
http://www.codemonkey.org.uk
