From: Mattia Dongili <dongili@supereva.it>
Subject: Re: Which cpufreq driver is best for ...
Date: Wed, 3 Sep 2003 17:52:02 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20030903155202.GG750@inferi.kami.home>
References: <20030903055749.GA21721@gamma.logic.tuwien.ac.at>
	<3F55D261.6010407@basmevissen.nl>
	<20030903143250.GC571@polaris.logic.tuwien.ac.at>
Reply-To: dongili@supereva.it
Mime-Version: 1.0
Return-path: <cpufreq-bounces@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20030903143250.GC571@polaris.logic.tuwien.ac.at>
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
To: cpufreq@www.linux.org.uk

On Wed, Sep 03, 2003 at 04:32:50PM +0200, Norbert Preining wrote:
> On Mit, 03 Sep 2003, Bas Mevissen wrote:
[...]
> I have this one running, it it called
> 	cpudyn(d)
> and is in debian/sid. Adapts to the load quite fast. Normallz the laptop
> is in 274MHz mode, but is going up to 2200MHz immediately when I start
> latex-ing or gcc-ing.
> 
> Now, what would be nice, is a cpudyn2 that steps the processor dependend
> on the load to different speeds.

you could try the CVS version of cpufreqd from
www.sf.net/projects/cpufreqd that support cpu load monitoring in it's
soon to be released version or

http://www.goop.org/~jeremy/speedfreq

or see this old thread:
http://www.linux.org.uk/mailman/private/cpufreq/2003-March/001862.html

hth
-- 
mattia
:wq!
