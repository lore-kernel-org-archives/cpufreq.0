From: Bruno Ducrot <ducrot@poupinou.org>
Subject: Re: little system-hang when switching frequencies
Date: Thu, 10 Jun 2004 11:08:15 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040610090815.GX13782@poupinou.org>
References: <1086717641.4311.30.camel@localhost>
	<20040609155946.GB9482@dominikbrodowski.de>
	<1086816407.2756.10.camel@localhost>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <1086816407.2756.10.camel@localhost>
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
To: Thomas Breitner <mail@tombreit.de>
Cc: cpufreq@www.linux.org.uk

On Wed, Jun 09, 2004 at 11:26:47PM +0200, Thomas Breitner wrote:
> Am Mi, den 09.06.2004 schrieb Dominik Brodowski um 17:59: 
> > On Tue, Jun 08, 2004 at 08:00:41PM +0200, Thomas Breitner wrote:

...

> Jun  9 21:34:01 localhost kernel: cpufreq: change to 997 MHz succeeded
> after 1 tries with result 0
> Jun  9 21:34:17 localhost kernel: cpufreq: retry 1, previous result 0
> Jun  9 21:34:17 localhost kernel: cpufreq: retry 2, previous result 0
> Jun  9 21:34:17 localhost kernel: cpufreq: retry 3, previous result 0
> Jun  9 21:34:17 localhost kernel: cpufreq: retry 4, previous result 0
> Jun  9 21:34:17 localhost kernel: cpufreq: retry 5, previous result 0
> Jun  9 21:34:17 localhost kernel: cpufreq: change to 731 MHz succeeded
> after 6 tries with result 0
> ---
> 
> i don't understand the meaning of result "0", but it seems that the
> system needs *only* one - the first - try to switch from low to high
> frequency - but it needs always 6 retries to switch back.
> ok, this part is *fixed*, i should buy a new laptop...

It's likely the SMI handler is not able to disable BM arbitration due to
DMA tranferts somehow.  It may be related to disk io, or sound, etc.
Then it give up.

...

> the same here: i followed your advise, but seemingly trust too much in
> my laptop (well, it is in fact an inspiron 8100...):
> changed (rev < 5) in (rev < 4) and ended up immediatly after loading
> speedstep-ich in a lockup (if thats the technical word for a completly
> non-respondent system).

For now, I don't have a clue to correct this with this northbridge.
We should check bus activities somehow before setting ARB_DIS probably.
I believe it's also needed even for other bridges btw.

> but: switching frequencies under the preinstalled win xp works "in both
> directions". how is this possible when it's the bios which is causing
> the "little system hang"?

No idea.  BTW, are you sure the frequency change under XP?  If yes,
there is likely a loop which somehow check BM activities (and is able to
yield the processor, of course) before calling the SMI handler.

Cheers,

-- 
Bruno Ducrot

--  Which is worse:  ignorance or apathy?
--  Don't know.  Don't care.
