From: Pavel Machek <pavel@ucw.cz>
Subject: Re: Athlon XP-M and cpufreq freezing Asus laptop to death
Date: Mon, 1 Sep 2003 22:09:42 +0200
Sender: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Message-ID: <20030901200941.GF1358@openzaurus.ucw.cz>
References: <20030824164828.GA922@renditai.milesteg.arr>
	<20030825071009.GH19292@poupinou.org>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20030825071009.GH19292@poupinou.org>
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
To: Ducrot Bruno <ducrot@poupinou.org>
Cc: davej@codemonkey.org.uk, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, cpufreq@www.linux.org.uk

Hi!

> This is a known issue (at least for me :).  When the difference
> between 2 vid and/or 2 fid are too big, that hang.
> 
> For now, as a quick (and mostly dirty though) solution is to go
> with the userspace governor only and to go to the lowest frequency with
> one or two step in-between.
> 
> I'm also wondering if those athlons have the same kind of stuff than
> the opteron (Dave)?

k8 has similar restriction to small steps, only.
				Pavel
-- 
				Pavel
Written on sharp zaurus, because my Velo1 broke. If you have Velo you don't need...
