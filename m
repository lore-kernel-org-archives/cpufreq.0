From: Bruno Ducrot <ducrot@poupinou.org>
Subject: Re: add new p3m model
Date: Mon, 15 Mar 2004 16:46:39 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040315154639.GT28592@poupinou.org>
References: <20040314152016.0B04B3F04@latitude.mynet.no-ip.org>
	<20040315141517.GG8636@dominikbrodowski.de>
	<20040315142022.GA7069@devserv.devel.redhat.com>
	<20040308111531.GD14593@devserv.devel.redhat.com>
	<20040308111531.GD14593@devserv.devel.redhat.com>
	<20040308133135.GU2869@poupinou.org>
	<20040314143407.GA21991@dominikbrodowski.de>
	<20040315142101.GB7069@devserv.devel.redhat.com>
	<20040315143827.GA9696@dominikbrodowski.de>
	<20040315144528.GC7069@devserv.devel.redhat.com>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20040315144528.GC7069@devserv.devel.redhat.com>
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
To: Arjan van de Ven <arjanv@redhat.com>
Cc: davej@redhat.com, aeriksson@fastmail.fm, cpufreq@www.linux.org.uk

On Mon, Mar 15, 2004 at 03:45:28PM +0100, Arjan van de Ven wrote:
> On Mon, Mar 15, 2004 at 03:38:27PM +0100, Dominik Brodowski wrote:
> > On Mon, Mar 15, 2004 at 03:21:01PM +0100, Arjan van de Ven wrote:
> > > 
> > > On Sun, Mar 14, 2004 at 03:34:07PM +0100, Dominik Brodowski wrote:
> > > > On Mon, Mar 08, 2004 at 12:15:31PM +0100, Arjan van de Ven wrote:
> > > > > Hi,
> > > > > 
> > > > > the patch below adds support for my laptop (Dell Inspiron 2600) which has
> > > > > ebx return 7 for the p3 mobile in it....
> > > > 
> > > > Can you send a /proc/cpuinfo, please?
> > > 
> > > processor	: 0
> > > vendor_id	: GenuineIntel
> > > cpu family	: 6
> > > model		: 11
> > > model name	: Mobile Intel(R) Celeron(TM) CPU         1200MHz
> >                                   ^^^^^^^
> > so it's not a mobile Pentium III-M as you said before; but a Celeron. 
> > Celeron's don't support SpeedStep [*].
> 
> Hmmmm. Dell provides a windows driver for it..

Are you sure that it's a speedstep driver?  I've seen a toshiba blurb
claiming Speedstep with 8 states on a PIII.  It was actually throttling
of course, not speedstep..

Cheers,

-- 
Bruno Ducrot

--  Which is worse:  ignorance or apathy?
--  Don't know.  Don't care.
