From: Jeremy Fitzhardinge <jeremy@goop.org>
Subject: Re: cpuspeed daemon
Date: 23 Jun 2003 11:48:05 -0700
Sender: cpufreq-admin@www.linux.org.uk
Message-ID: <1056394085.5719.2.camel@localhost.localdomain>
References: <1056238149.30963.394.camel@ixodes.goop.org>
	 <1056238942.38e68448bf0bf@carlthompson.net>
	 <1056346987.15249.21.camel@ixodes.goop.org>
	 <1056393765.4cc7b6562be56@carlthompson.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-admin@www.linux.org.uk>
In-Reply-To: <1056393765.4cc7b6562be56@carlthompson.net>
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
To: Carl Thompson <cet@carlthompson.net>
Cc: cpufreq list <cpufreq@www.linux.org.uk>

On Mon, 2003-06-23 at 11:42, Carl Thompson wrote:
> Great minds think alike.  I almost picked "Speed Freq" as my new name before
> settling on "Speed Daemon" !

Heh.  I think the speed puns are inevitable with this kind of thing.

> 
> > What does your daemon do?
> 
> Pretty much the same thing except mine actually does make policy decisions
> and does not yet have a sophisticated plugin infrastructure like yours.

You must be thinking of something other project.  I don't have a plugin
infrastructure, and I'm hoping to never have one.  I'm just trying to do
a simple policy enforcement mechanism, on the grounds that there's
plenty of other people doing policy setting daemon/user interfaces.

	J
