From: Ducrot Bruno <ducrot@poupinou.org>
Subject: Re: [ACPI] _PDC method in DSDT
Date: Thu, 26 Jun 2003 13:13:38 +0200
Sender: cpufreq-admin@www.linux.org.uk
Message-ID: <20030626111338.GS19556@poupinou.org>
References: <20030623161136.GG19556@poupinou.org> <1056388336.15250.62.camel@ixodes.goop.org> <1056398545.10322.111.camel@aldebaran.caltech.edu> <20030623213726.GA1317@brodo.de> <1056417280.10323.148.camel@aldebaran.caltech.edu> <1056418635.5977.20.camel@sherkaner.pao.digeo.com> <1056420149.10322.160.camel@aldebaran.caltech.edu> <20030624091836.GI19556@poupinou.org> <1056491271.3979.15.camel@aldebaran.caltech.edu> <20030626104041.GR19556@poupinou.org>
Mime-Version: 1.0
Return-path: <cpufreq-admin@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20030626104041.GR19556@poupinou.org>
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
Content-Transfer-Encoding: 7bit
To: David Moore <dcm@acm.org>
Cc: acpi-devel@lists.sourceforge.net, cpufreq list <cpufreq@www.linux.org.uk>

> > Dword 0 should be 0x1
> > Dword 1 should be 0x1
> > Dword 2 should be 0x1
> > 
> > The 0x1 in Dword 2 indicates that the driver supports Enhanced
> > Speedstep.  In my DSDT, Dwords 0 and 1 are ignored anyway, but the
> > values above should be correct.
> 
> Sound like ok, but not for Dword 0.  Will look more at it then.

Ok.  Actually Dword 0 seems to be 0x0001.  Sorry.

-- 
Ducrot Bruno

--  Which is worse:  ignorance or apathy?
--  Don't know.  Don't care.
