From: David Tam <tamda@eecg.toronto.edu>
Subject: RE: governor implementations
Date: Thu, 29 Apr 2004 21:46:40 -0400 (EDT)
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <Pine.LNX.4.44.0404292040380.1552-100000@cat.eecg.toronto.edu>
References: <E1BJM2v-0001tP-Nf@www.linux.org.uk>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
In-Reply-To: <E1BJM2v-0001tP-Nf@www.linux.org.uk>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@www.linux.org.uk
Cc: wtsang@dgp.toronto.edu, Catalin Drula <catalin@cs.toronto.edu>

Hi.

We did some work along these lines for a grad course project in Dec 2003.
It was done using a development version of Linux kernel 2.6.
Unfortunately, we haven't had time to keep it up to date.
Hopefully, it only requires minor updates.

Here is a link to the web page.  You can check out our presentation slides,
final report, and other docs.
http://www.eecg.toronto.edu/~tamda/csc2228/

> Message: 3
> Date: Thu, 29 Apr 2004 17:37:52 -0700
> From: "Pallipadi, Venkatesh" <venkatesh.pallipadi@intel.com>
> Subject: RE: governor implementations
> To: "Nickolai Zeldovich" <nickolai@cs.stanford.edu>
> Cc: cpufreq@www.linux.org.uk
> 
> Attached is a simple in-kernel CPU frequency governor. This has some
> minor modification to the one that I had sent on this list, couple of
> months back.
> 
> The main features:
> - Checks CPU utilization periodically and increases the frequency to the
> maximum whenever the utilization is high.
> - Does similar check and tries to reduce the frequency when utilization
> is low. But, by default, this check is done less frequently compared to
> 'increasing the frequency' checks.
> - Default values of above frequencies depends on actual frequency
> transition latency of the CPU.
> - User can fine tune by using the parameters exported in /sys
> - As things are done inside the kernel, this should have lesser overhead
> compared to user daemon and reading CPU utilization information from
> /proc or /sys. 
> 
> Patch is against latest 2.6 kernels. Try it and let me know your
> feedback.
> 
> >-----Original Message-----
> >From: cpufreq-bounces@www.linux.org.uk 
> >[mailto:cpufreq-bounces@www.linux.org.uk] On Behalf Of 
> >Nickolai Zeldovich
> >Sent: Thursday, April 29, 2004 3:27 PM
> >To: cpufreq@www.linux.org.uk
> >Subject: governor implementations
> >
> >Has there been any effort on implementing governors other than the 3
> >standard ones included in the kernel these days (powersave, performance
> >and userspace), or adding hooks to the kernel scheduler to 
> >interact with
> >the userspace governor (that is, the userspace process, and 
> >not the part
> >of cpufreq code)?
> >
> >The problem I see is that currently there's no way to do fine-grained
> >CPU speed adjustments to match the immediate user need.  
> >Currently there
> >are user-space daemons like cpuspeed that will poll your load 
> >average at
> >some intervals and adjust the CPU speed accordingly, but polling is not
> >the right answer -- you can't poll fast enough to provide a smooth user
> >experience without using up too much CPU for polling, I would guess.
> >For example, Fedora Core 2 (test3) comes with cpuspeed that slows down
> >my laptop from 1.6GHz to 600MHz.  That's great, but when I click on a
> >menu in a Gnome application, it takes a long time to come up.  Even
> >polling at 100ms, cpuspeed can't respond fast enough to this 
> >user action
> >to speed up the CPU and make the menu come up faster.
> >
> >On the other hand, implementing an in-kernel governor, or 
> >exporting user
> >callbacks like "the last tick was completely CPU bound, do something!",
> >would allow fine-grained adjustment that would increase the 
> >CPU speed as
> >soon as the user started doing something, and would similarly 
> >be able to
> >quickly decrease it back down to save power.
> >
> >So in summary, it seems to me that much better power savings and user
> >performance can be achieved by integrating cpuspeed much 
> >closer with the
> >scheduler -- I'd imagine people have thought about this already, so I'm
> >looking for references to such work out there..

-- 
David Tam <tamda@eecg.toronto.edu>
Graduate Student, ECE Dept, University of Toronto
http://www.eecg.toronto.edu/~tamda
