From: Bruno Ducrot <ducrot@poupinou.org>
Subject: Re: powernow-k8 won't load on Athlon64
Date: Tue, 24 Aug 2004 16:35:21 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040824143521.GK29560@poupinou.org>
References: <cg2jui$tba$1@sea.gmane.org> <20040823154633.GJ29560@poupinou.org>
	<loom.20040823T184514-973@post.gmane.org>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <loom.20040823T184514-973@post.gmane.org>
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
To: Ari Pollak <ajp@aripollak.com>
Cc: cpufreq@www.linux.org.uk

Hi,

On Mon, Aug 23, 2004 at 04:45:36PM +0000, Ari Pollak wrote:
> Bruno Ducrot <ducrot <at> poupinou.org> writes:
> > Then could you mail me (privately) or better give us a link to this
> > acpidmp.out.bz2?
> 
> Sure, it's up here: http://stuff.ebnj.net/acpidmp.out.bz2

A (quick) decodage by hand show there is 3 P-states, which contains
those settings:

freq: 1600000    voltage 950
freq: 1400000    voltage 950
freq: 1200000    voltage 950

Voltage don't change (weird), and all frequencies are below 1.6GHz, so there
are all 'low'...  Those values are indeed completely bogus..
Complain to the bios writter (and ask Paul to give you some better tables
for overriding purposes.  He like to give them ;)

Cheers,

-- 
Bruno Ducrot

--  Which is worse:  ignorance or apathy?
--  Don't know.  Don't care.
