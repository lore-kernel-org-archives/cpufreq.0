From: John Clemens <john@deater.net>
Subject: Re: CPUSpeed 1.1 released (finally)
Date: Sun, 30 Nov 2003 19:52:35 -0500 (EST)
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <Pine.LNX.4.58.0311301942280.8448@pianoman.cluster.toy>
References: <1068264857.2c5ff476f0b29@carlthompson.net>
	<20031110091330.GJ21970@poupinou.org>
Mime-Version: 1.0
Return-path: <cpufreq-bounces@www.linux.org.uk>
In-Reply-To: <20031110091330.GJ21970@poupinou.org>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces@www.linux.org.uk
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ducrot Bruno <ducrot@poupinou.org>
Cc: CPUFreq Mailing List <cpufreq@www.linux.org.uk>


On Mon, 10 Nov 2003, Ducrot Bruno wrote:

> > * Crash-proof frequency switching even if you have a very tempermental CPU
> >   (some AMD mobile Athlons in particular)
>
> That's no more true those days...

(going through the archives..) I noticed the above, does that mean the
"athlon giant leap bug" was fixed in the driver?  if so, how? was it the
below snippit from what went into 2.6.0-test6?

if so, i'd love to rip the workaround out of powernowd..
john.c

@@ -297,8 +301,14 @@
	dprintk (" voltage regulator)\n");

	latency = psb->settlingtime;
+ 	if (latency < 100) {
+ 		printk (KERN_INFO PFX "BIOS set settling time to %d microseconds."
+ 		"Should be at least 100. Correcting.\n", latency);
+ 		latency = 100;
+ 	}
	dprintk (KERN_INFO PFX "Settling Time: %d microseconds.\n", psb->settlingtime);
	dprintk (KERN_INFO PFX "Has %d PST tables. (Only dumping ones relevant to this CPU).\n", psb->numpst);
+ 	latency *= 100; /* SGTC needs to be in units of 10ns */

	p += sizeof (struct psb_s);


-- 
John Clemens          http://www.deater.net/john
john@deater.net     ICQ: 7175925, IM: PianoManO8
      "I Hate Quotes" -- Samuel L. Clemens
