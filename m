From: Ducrot Bruno <ducrot@poupinou.org>
Subject: Re: Userspace: available processorspeeds
Date: Mon, 6 Oct 2003 14:38:16 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20031006123816.GP11391@poupinou.org>
References: <3F81339D.6010305@ITS.TUDelft.nl>
Mime-Version: 1.0
Return-path: <cpufreq-bounces@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <3F81339D.6010305@ITS.TUDelft.nl>
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
To: Jeroen Van der Vegt <A.J.vanderVegt@ITS.TUDelft.nl>
Cc: cpufreq@www.linux.org.uk

On Mon, Oct 06, 2003 at 11:19:25AM +0200, Jeroen Van der Vegt wrote:
> Hello,
> 
> I'm trying to write a userspace processor-speed governor for my laptop, 
> an Asus L3000D. It has an AMD Athlon Mobile processor and runs on Linux 
> 2.6.0-test5 (and Debian unstable).
> 
> For some reason, my laptop crashes when the speed changes from maximum 
> to minimum at once. So my program is to step the speed only to the next 
> level available. This is repeated every 5 seconds, so both the maximum 
> and minimum speed are reachable.

Please be sure to upgrade to linux-2.6.0-test6 at least, due to some bugs
in previous versions in powernow-k7.

> The available speeds are printed when the module PowerNow is loaded, but 
> isn't there a 'better' way to retrieve this information? There doesn't 
> seem to be a file listing all possible speeds in either /proc nor /sys. 
> Have I overlooked a file perhaps, or is there some function call I can use?
> 
> Besides this, I have experienced the following weirdness: according to 
> /sys/.../scaling_min_freq, my processor's minimum speed is 532 Mhz. I 
> have, however, had it running at 292Mhz (as reported by /proc/cpuinfo). 

Strange.  Perhaps a bug somewhere in core?

> It's not really reproducible unfortunately, and I only noticed it once 
> or twice.The laptops keeps working fine though, so it's not much of a 
> problem to that respect. Any actions I should take the next time I see it?

Look what say bogomips, or x86info --mhz

Cheers,

-- 
Ducrot Bruno

--  Which is worse:  ignorance or apathy?
--  Don't know.  Don't care.
