From: Bruno Ducrot <ducrot@poupinou.org>
Subject: Re: [PATCH] powernow-k7: Userspace PST for Athlon XP-M on
	desktop	boards
Date: Tue, 15 Jun 2004 11:27:09 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040615092709.GN1095@poupinou.org>
References: <20040614211726.905A94BAAB@nathan.muc.de>
	<20040614214803.GA17747@dominikbrodowski.de>
	<1087253151.4456.11.camel@delerium.codemonkey.org.uk>
	<20040615060454.9AED14BAAD@nathan.muc.de>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20040615060454.9AED14BAAD@nathan.muc.de>
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
To: Harald Milz <milz@seneca.muc.de>
Cc: cpufreq@www.linux.org.uk

On Tue, Jun 15, 2004 at 08:04:54AM +0200, Harald Milz wrote:
> Dave Jones <davej@redhat.com> wrote:
> > What's the general consensus on this ? It seems to be an ugly hack for a
> > minority of users, who seem able to recompile their kernel with a
> > hardwired table.  Maybe it sounds a little elitist, but if someone
> 
> Oh no it's not about a hardwired table. This is why I chose the command
> line approach. The goal is to have this in the main distribution so that
> nobody needs to recompile a kernel. 
> 
> > can't compile their kernel, should we make it easier to allow them to
> > potentially do bad things to their processor ?
> 
> As far as I can see you can't do bad things to your CPU. The module will
> not set the multiplier above what the CPU thinks is okay. So no
> overclocking is possible with the current code. But hey, it's open source.
> You can override anything within the module, even the CPU's perception of
> maxfid. You can't keep people from jumping out of a window ... 

That Dave's point actually.  If someone want to modify powernow-k7,
because the BIOS is broken, he is free to do so.  It's not that hard and
anyway such hardwired tables have been posted to this list already.
The main advantage for this is that the guy have to read at least
the code, do some search (preferably in this list, perhaps), and
so he will learn what actually are those funny VID, FID etc.

> I am not sure about the "minority" -- I keep hearing many Athlon XP-M
> notebooks have broken BIOSes. At the moment these folks can't really use
> powernow-k7 anyway - and for whom else is the module? 

The recent ACPI stuff do have actually helped already..

> Has anyone got Bruno's patch? 

http://www.poupinou.org/cpufreq/powernow-k7/
But it need reworking due to some change in powernow-k7.  And I must
admit I have now the same kind of concern than Dave anyway.

-- 
Bruno Ducrot

--  Which is worse:  ignorance or apathy?
--  Don't know.  Don't care.
