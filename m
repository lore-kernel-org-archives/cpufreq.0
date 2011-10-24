From: Dave Jones <davej@redhat.com>
Subject: Re: Request for DIscussion: Cpufreq logging, and frequency floors
Date: Sun, 23 Oct 2011 20:01:59 -0400
Message-ID: <20111024000158.GA19078@redhat.com>
References: <465E946FB313F242A955E3365C8D13A510491297@ushqwmb10>
 <20111023114802.GA15272@sirena.org.uk>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20111023114802.GA15272@sirena.org.uk>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mark Brown <broonie@opensource.wolfsonmicro.com>
Cc: "Steven Finney (Palm GBU)" <Steven.Finney@palm.com>, "cpufreq@vger.kernel.org" <cpufreq@vger.kernel.org>

On Sun, Oct 23, 2011 at 12:48:03PM +0100, Mark Brown wrote:
 > On Fri, Oct 21, 2011 at 02:31:57PM -0700, Steven Finney (Palm GBU) wrote:
 > 
 > >  2) The ability to keep a diagnostic log of all the frequency changes so, 
 > > e.g., it's possible to determine if bad behavior (e.g. dropouts) is
 > > correlated with a low frequency.
 > 
 > This is a really good and useful idea but it seems to me like it would
 > be better done with the standard trace subsystem - that provides good
 > facilities for enabling and disabling the trace as needed and would make
 > it easy to tie in with the other subsystems that are in play.
 
Indeed. This sounds like the direction to go towards. Having played a little
with Steven Rostedt's kernelshark tool, I could see interesting things coming
from being able to correlate transitions with other system events graphically.

	Dave

