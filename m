From: Sven Dowideit <svenud@ozemail.com.au>
Subject: Re: Dynamic frequency governor
Date: Tue, 21 Oct 2003 09:28:52 +1000
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <1066692531.1159.26.camel@sven>
References: <CFF522B18982EA4481D3A3E23B83141C24B4B3@orsmsx407.jf.intel.com>
	<20031020170010.GF21438@redhat.com>
	<20031020172503.GE13989@poupinou.org>
	<20031020173205.GG21438@redhat.com>
	<20031020173509.GF13989@poupinou.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces@www.linux.org.uk>
In-Reply-To: <20031020173509.GF13989@poupinou.org>
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
To: cpufreq@www.linux.org.uk

Hey guys,

can we avoid the issue completely, by taking something like powertweak,
which will let you monitor any system value(s), and then use a
combination of the values the user selected to determine the speed? 

(though on my BX notebook i only get 2 speed, 700Mhz and 850Mhz)

though most of this functionality does not exist in powertweak yet.. I
still need to add getting values at regular intervals, and some generic
calculation engine.

the first i will do anyway as i want to provide a graph


sven

On Tue, 2003-10-21 at 03:35, Ducrot Bruno wrote:
> On Mon, Oct 20, 2003 at 06:32:05PM +0100, Dave Jones wrote:
> > On Mon, Oct 20, 2003 at 07:25:03PM +0200, Ducrot Bruno wrote:
> > 
> >  > AFAIR, there is no patent if wide system policy which is what Bob want
> >  > to implement.  Only per-process (which is the most fun unfortunately) are
> >  > patented.  That need to be confirmed though (by Alan ?).
> > 
> > I was under the understanding that there was a patent on
> > "recalculate cpu frequency based on idle time" too.
> > 
> 
> Grumble.  I was probably mistaken.  Sorry.
