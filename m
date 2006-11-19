From: Michael Meskes <meskes@debian.org>
Subject: Re: Centrino based CPU not recognized
Date: Sun, 19 Nov 2006 10:21:15 +0100
Message-ID: <20061119092115.GA8559@feivel.credativ.de>
References: <EB12A50964762B4D8111D55B764A8454E766ED@scsmsx413.amr.corp.intel.com>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <EB12A50964762B4D8111D55B764A8454E766ED@scsmsx413.amr.corp.intel.com>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=m.gmane.org+glkc-cpufreq=m.gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Pallipadi, Venkatesh" <venkatesh.pallipadi@intel.com>
Cc: cpufreq@lists.linux.org.uk

On Sat, Nov 18, 2006 at 09:23:44AM -0800, Pallipadi, Venkatesh wrote:
> What is the BIOS version btw?

It's F07. 

> There was a similar report here
> http://bugme.osdl.org/show_bug.cgi?id=7157
> about HP NC6400

Yes, I know about some of those reports. However, only F07 is able to
cope with Core2Duos. I tried downgrading to F06 which miserably failed.
I am also planning got open a support call to HP asap, but since the
driver said it found an unsupported CPU with Enhanced SpeedStep, I
wonder if this really is a BIOS problem. Especially with the model
number not listed in the module. Or is speedstep-centrino not supposed
to work with Core2Duos?  

Is it correct that centrino_cpu_init is called twice? Is there a way to
make the linux kernel only use one core?

Michael
-- 
Michael Meskes
Email: Michael at Fam-Meskes dot De, Michael at Meskes dot (De|Com|Net|Org)
ICQ: 179140304, AIM/Yahoo: michaelmeskes, Jabber: meskes@jabber.org
Go SF 49ers! Go Rhein Fire! Use Debian GNU/Linux! Use PostgreSQL!
