From: paul.devriendt@amd.com
Subject: RE: powernow-k8 won't load on Athlon64
Date: Tue, 24 Aug 2004 11:21:33 -0500
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <84EA05E2CA77634C82730353CBE3A8439913D5@SAUSEXMB1.amd.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
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
To: ducrot@poupinou.org, ajp@aripollak.com
Cc: cpufreq@www.linux.org.uk

> > Sure, it's up here: http://stuff.ebnj.net/acpidmp.out.bz2
> 
> A (quick) decodage by hand show there is 3 P-states, which contains
> those settings:
> 
> freq: 1600000    voltage 950
> freq: 1400000    voltage 950
> freq: 1200000    voltage 950
> 
> Voltage don't change (weird), and all frequencies are below 
> 1.6GHz, so there
> are all 'low'...  Those values are indeed completely bogus..
> Complain to the bios writter (and ask Paul to give you some 
> better tables
> for overriding purposes.  He like to give them ;)

Thanks Bruno, I had pulled the file down but had not gotten 
around to looking at it yet. Those values are not going to
work ... I am sticking with my guess of leftover K7 stuff.

AMD publishes the frequency/voltage info for Athlon64 ... you
do not need to ask me ;) It is on AMD's web site, in the Power 
and Thermal Data Sheet, document number 30430.

Paul.
