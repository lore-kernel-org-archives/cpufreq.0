From: Ducrot Bruno <ducrot@poupinou.org>
Subject: Re: [PATCHSET] 0/3 Dynamic cpufreq governor and updates to ACPI
	P-state driver
Date: Thu, 23 Oct 2003 20:03:00 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20031023180300.GT13989@poupinou.org>
References: <88056F38E9E48644A0F562A38C64FB6007793C@scsmsx403.sc.intel.com>
	<1066897184.395.1.camel@laptop.fenrus.com>
	<20031023082401.GE3847@sam-solutions.net>
	<20031023102937.B18225@devserv.devel.redhat.com>
Mime-Version: 1.0
Return-path: <cpufreq-bounces@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20031023102937.B18225@devserv.devel.redhat.com>
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
To: Arjan van de Ven <arjanv@redhat.com>
Cc: "Pallipadi, Venkatesh" <venkatesh.pallipadi@intel.com>, linux-acpilinux-acpi@intel.com, cpufreq@www.linux.org.uk

On Thu, Oct 23, 2003 at 10:29:37AM +0200, Arjan van de Ven wrote:
> On Thu, Oct 23, 2003 at 11:24:01AM +0300, Alexander Bokovoy wrote:
> > On Thu, Oct 23, 2003 at 10:19:44AM +0200, Arjan van de Ven wrote:
> > > On Wed, 2003-10-22 at 20:21, Pallipadi, Venkatesh wrote:
> > > 
> > > > And with the kind of power savings that comes with these frequency
> > > > changes, this behaviour 
> > > > results in  longer battery life. However, as yet I do not have any
> > > > numbers to quantify this gain, 
> > > > mainly because I do not have any setup where I can measure actual power.
> > > >  
> > > 
> > > some time ago I did this by using the ACPI method of asking the battery
> > > what the current use is at this point in time; it's of course not as
> > > exact as a full measurement setup but it's a nice poor mans power watch
> > > too ....
> > Unfortunately, there is a number of ACPI-enabled BIOSes which report wrong
> > battery rate when EST is in action -- they still continue to report a rate
> > which corresponds to highest CPU frequency despite the fact that actual
> > frequency might be the lowest one.
> 
> ok I admit to cheating and not actually using ACPI but talking
> to the battery directly based on reverse engineered info (partially based
> on the AML, mostly on "if I do this what value changes" ;)

Most modern embedded chips 'cache' results.  Better to go directly
to the smbus for those one, and talk to the smart battery slave.

-- 
Ducrot Bruno

--  Which is worse:  ignorance or apathy?
--  Don't know.  Don't care.
