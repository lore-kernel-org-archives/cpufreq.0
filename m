From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 8081] Conservative governor sets wrong and too high sampling
	rates
Date: Sat, 18 Aug 2007 01:21:03 -0700 (PDT)
Message-ID: <20070818082104.06684108056@picon.linux-foundation.org>
References: <bug-8081-3570@http.bugzilla.kernel.org/>
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk>
In-Reply-To: <bug-8081-3570@http.bugzilla.kernel.org/>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org+glkc-cpufreq=gmane.org@lists.linux.org.uk
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@www.linux.org.uk

http://bugzilla.kernel.org/show_bug.cgi?id=8081


alex-kernel@digriz.org.uk changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
         AssignedTo|cpufreq@www.linux.org.uk    |alex-kernel@digriz.org.uk
             Status|NEW                         |ASSIGNED




------- Comment #4 from alex-kernel@digriz.org.uk  2007-08-18 01:28 -------
(In reply to comment #3)
> 
> I think that 10 * latency bit for the default sampling rate was deliberate,
> since it was introduced as a standalone patch some time ago:
> http://osdir.com/ml/kernel.cpufreq/2006-03/msg00048.html
> 
Yes it was, the idea was to prevent the governor being as trigger happy as
ondemand; without it you would go from [min-freq]->[max-freq] in about 0.5
seconds :)

Stefano has been bugging me about this for ages but keeps wanting me just to
blat def_sampling_rate to what it used to be when I forked conservative from
ondemand.  It was my bad to not deal with this problem eariler.

> However, that patch neglected to make a corresponding change to the rules for
> the minimum sampling rate.
> 
> The result is that, on my amd64 system, the default sampling rate is 12.4
> seconds, and the fastest rate is 6.2 seconds.
> 
> My CPU (athlon64 x2 4400) has speeds of 1000, 1800, 2000, and 2200 MHz
> available to cpufreq.  With the defaults in the conservative governor then, it
> will take it 99.2 seconds at full load to decide to notch it up from 1000 to
> 1800MHz (8 sampling rates each stepping the target speed by 100MHz).  This
> calculation matches with some empirical observations I did.
> 
> I see two fixes that should be made from this:
> 
> 1) The MIN_SAMPLING_RATE_RATIO define should be changed from 2 to 20, to match
> the 10x change in the default sampling rate.  This would at least allow saner
> configurations to be put in place by hand.
> 
> 2) Instead of stepping the target frequency by a mythical 5% that probably
> cannot be satisified by hardware, shouldn't it just step it up or down one
> entry in the available frequencies table?
> 
The mythical 5% is there try and produce a result that is more like a smooth
change through speed.  It was done, this was the plan at least, so that in a
fixed time period and at full load on any machine the governor would move from
the minimum to highest clock speed.  Obviously this is not happening so it is
back to the drawing board.

It is not simple to just pull the frequencies and step through those, it was
beyond my understanding of C and the kernel (I think I vaguely recall someone
back in the midst's of time saying this was a Bad Idea and not possible anyway)
to import them into the governor besides the final result of either stepping in
5% incremements or the actually frequencies themselves is the same; I would
just say in the latter case it makes it easier to true to bring in a 'constant
time' element.

Anyway, now I know there are at least two folks suffering this problem I'll
look into fixing it but it might be a month before something is produced; Real
Life has hit me pretty hard with work and finding a place to live.

Cheers

Alex


-- 
Configure bugmail: http://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
You are the assignee for the bug, or are watching the assignee.
