From: Dave Jones <davej@redhat.com>
Subject: Re: [PATCH] powernow-k7: Userspace PST for Athlon XP-M on desktop
	boards
Date: Mon, 14 Jun 2004 23:45:51 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <1087253151.4456.11.camel@delerium.codemonkey.org.uk>
References: <20040614211726.905A94BAAB@nathan.muc.de>
	<20040614214803.GA17747@dominikbrodowski.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
In-Reply-To: <20040614214803.GA17747@dominikbrodowski.de>
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
To: Dominik Brodowski <linux@dominikbrodowski.de>
Cc: Harald Milz <milz@seneca.muc.de>, cpufreq@www.linux.org.uk

On Mon, 2004-06-14 at 22:48, Dominik Brodowski wrote:
> On Mon, Jun 14, 2004 at 11:17:26PM +0200, Harald Milz wrote:
> > +MODULE_PARM (mycpuid, "i");
> > +MODULE_PARM (myfsbspeed, "i");
> > +MODULE_PARM (mymaxfid, "i");
> > +MODULE_PARM (mystartvid, "i");
> > +MODULE_PARM (mynumpstates, "i");
> 
> Please use module_param{,_array}() instead -- MODULE_PARM is deprecated.
> 
> > +				for (i=0; i<mynumpstates; i++) {
> > +					*t = myfids[i]; t++;
> > +					*t = myvids[i] == 0 ? mystartvid : myvids[i] ; t++;
> > +					dprintk (KERN_INFO PFX "fid: 0x%x; vid: 0x%x; t: %p\n", myfids[i], myvids[i], t);
> > +				}				
> > +				psb->numpst = 1;
> > +			}
> > +
> 
> Some sanity checking is definitely necessary, IIRC Bruno's
> in-kernel-hardcoded-table did have some. I have no opinion yet which way
> (Bruno's in-kernel or your module-parameter) is preferrable...

I'm not entirely keen on this tbh.  (Although I don't recall exactly
what right now, I think I had some reservations about Bruno's approach
too -- or maybe my mind is playing tricks, and I need to see that patch
again).

What's the general consensus on this ? It seems to be an ugly hack for a
minority of users, who seem able to recompile their kernel with a
hardwired table.  Maybe it sounds a little elitist, but if someone
can't compile their kernel, should we make it easier to allow them to
potentially do bad things to their processor ?

Additionally, I think I prefer Bruno's approach to adding more userspace
interfaces, especially to a chipset driver rather than the cpufreq
layer.

	Dave
