From: Carl Thompson <cet@carlthompson.net>
Subject: Re: cpuspeed daemon
Date: Mon, 23 Jun 2003 11:42:45 -0700
Sender: cpufreq-admin@www.linux.org.uk
Message-ID: <1056393765.4cc7b6562be56@carlthompson.net>
References: <1056238149.30963.394.camel@ixodes.goop.org>
	<1056238942.38e68448bf0bf@carlthompson.net>
	<1056346987.15249.21.camel@ixodes.goop.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-admin@www.linux.org.uk>
In-Reply-To: <1056346987.15249.21.camel@ixodes.goop.org>
Content-Disposition: inline
Errors-To: cpufreq-admin@www.linux.org.uk
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Id: <cpufreq.vger.kernel.org>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq/>
Content-Type: text/plain; charset="us-ascii"
To: Jeremy Fitzhardinge <jeremy@goop.org>
Cc: cpufreq list <cpufreq@www.linux.org.uk>

Quoting Jeremy Fitzhardinge <jeremy@goop.org>:

> On Sat, 2003-06-21 at 16:42, Carl Thompson wrote:
> > Darn it, you picked the same name I was using for the new version of
> > my CPUFreq daemon!  (It was called cpufreq, but I thought that was too
> > confusing).  Well, since I haven't posted it here under the new name
> > yet I guess I'll have to find another name...
>
> Well, I just changed the name to "speedfreq", so you can have cpuspeed
> if you want.

If you prefer the name "cpuspeed" then you should keep it.  I don't mind
using a different name.  If you really do prefer "speedfreq" then I'll use
"cpuspeed" .

Great minds think alike.  I almost picked "Speed Freq" as my new name before
settling on "Speed Daemon" !

> What does your daemon do?

Pretty much the same thing except mine actually does make policy decisions
and does not yet have a sophisticated plugin infrastructure like yours.
That is planned (though not as complex) but put off until I can get my
laptop to actually run the 2.5 kernel.  Currently it monitors CPU usage,
temperature and the AC adapter and sets the CPU speed accordingly.

I'll try to post an updated version in the next day or so.

> 	J

Carl
