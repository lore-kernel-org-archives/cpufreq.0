From: Mattia Dongili <dongili@supereva.it>
Subject: Re: [PATCH] cpufreq_ondemand
Date: Mon, 18 Oct 2004 10:12:17 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20041018081217.GA3145@inferi.kami.home>
References: <20041017222916.GA30841@inskipp.digriz.org.uk>
	<20041018072045.GA17164@dominikbrodowski.de>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20041018072045.GA17164@dominikbrodowski.de>
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
To: cpufreq@www.linux.org.uk, linux-kernel@vger.kernel.org
Cc: Alexander Clouter <alex-kernel@digriz.org.uk>

On Mon, Oct 18, 2004 at 09:20:45AM +0200, Dominik Brodowski wrote:
> Hi,
[...]
> > 2. controllable through 
> > 	/sys/.../ondemand/ignore_nice, you can tell it to consider 'nice' 
> > 	time as also idle cpu cycles.  Set it to '1' to treat 'nice' as cpu 
> > 	in an active state.
> 
> Interesting bit, IIRC some userspace tool also does that.

I'm implementing an "nice_scale" parameter in cpufreqd that offers more
control on nice cpu time. It's just a parameter (whose value must be >=
1 or if 0 don't care nice time at all) that tells _how_much_ the nice
time has to be take into consideration. It would be nice to have it in
the ondemand governor too.

bye
-- 
mattia
:wq!
