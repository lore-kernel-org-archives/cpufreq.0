From: Dave Jones <davej@redhat.com>
Subject: Re: [PATCH][DOCUMENTATION BUGFIX] latency in micro-, not nanoseconds
Date: Wed, 12 Nov 2003 14:17:54 +0000
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20031112141754.GC31026@redhat.com>
References: <20031110171533.GS21970@poupinou.org>
	<20031104160816.GA9187@brodo.de>
	<20031110163209.GP10144@redhat.com>
	<20031110171533.GS21970@poupinou.org>
	<20031110172246.GT10144@redhat.com>
	<20031110205029.GA7149@brodo.de>
	<20031110211654.GA10144@redhat.com>
	<20031111185417.GB4825@brodo.de>
	<20031111224501.GA30698@redhat.com>
	<20031112110134.GR29175@poupinou.org>
Mime-Version: 1.0
Return-path: <cpufreq-bounces@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20031112110134.GR29175@poupinou.org>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ducrot Bruno <ducrot@poupinou.org>
Cc: cpufreq@www.linux.org.uk, Dominik Brodowski <linux@brodo.de>

On Wed, Nov 12, 2003 at 12:01:34PM +0100, Ducrot Bruno wrote:
 > On Tue, Nov 11, 2003 at 10:45:02PM +0000, Dave Jones wrote:
 > > On Tue, Nov 11, 2003 at 07:54:17PM +0100, Dominik Brodowski wrote:
 > >  > BTW, it's not enough for powernow-k7 to divide the BIOS-known latency by 50.
 > >  > This latency for one VID and one FID transition needs to be multiplied by
 > >  > the number of p-states minus 1, as that's the actual maximum latency due to
 > >  > the "one step up/down only" loop, IIRC.
 > > 
 > > Yoinks, I thought I had merged that patch (so did you judging from
 > > that last sentence), but it fell through the cracks somehow.
 > > I'll see if I can dig it out if I still have it.
 > > 
 > > 		Dave
 > > 
 > 
 > I expected that correcting latency and fixing the change_[FV]ID()
 > will make any patch doing 'one step up/down only' for K7 to be rejected?

Worse yet, I can't put my finger on the mail that had the patch.
I'll dig some more, but I'm wondering if this was lost in the
window between a backup and my IBM deskstars dieing a few months back.

Might have to hack something up from scratch after all..

		Dave
