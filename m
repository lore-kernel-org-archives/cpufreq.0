From: Bruno Ducrot <ducrot@poupinou.org>
Subject: Re: Help with Installation
Date: Tue, 6 Apr 2004 10:25:52 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040406082552.GX19001@poupinou.org>
References: <20040403145045.GV19001@poupinou.org>
	<20040403171633.610cc960.frx@firenze.linux.it>
	<200404031342.34522.ozeki@simnet.is>
	<20040403145045.GV19001@poupinou.org>
	<20040403171633.610cc960.frx@firenze.linux.it>
	<20040403172242.D5553@flint.arm.linux.org.uk>
	<20040404195730.6fac6745.frx@firenze.linux.it>
	<20040404211144.GA9552@dominikbrodowski.de>
	<20040405222015.4a560be1.frx@firenze.linux.it>
	<20040405211131.GA7586@dominikbrodowski.de>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20040405211131.GA7586@dominikbrodowski.de>
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
To: Francesco Poli <frx@firenze.linux.it>, cpufreq@www.linux.org.uk

On Mon, Apr 05, 2004 at 11:11:31PM +0200, Dominik Brodowski wrote:
> On Mon, Apr 05, 2004 at 10:20:15PM +0200, Francesco Poli wrote:
> > On Sun, 4 Apr 2004 23:11:44 +0200 Dominik Brodowski wrote:
> > 
> > > Well, it might be usefull for you and others if someone (you?) could
> > > provide such up-to-date patches, and keeps 2.4. cpufreq up-to-date
> > > with recent 2.6. developments, as far as the latter is possible.
> > > However, none of the people currently active in cpufreq development
> > > seem to have sufficient time to do so. In case _you_ want to do it [as
> > > you said, it shouldn't be so difficult], please do so.
> > 
> > Perhaps it would be useful to setup a little script that
> > 
> > 1) downloads the latest 2.4.x kernel (maybe via rsync)
> > 2) modifies it using latest cpufreq from
> >    http://ftp.linux.org.uk/pub/linux/cpufreq/
> > 3) creates the patch against the unmodified kernel
> > 4) gzips it and moves the resulting file in the right place
> 
> IMHO, such a script can only work well if it is "being watched", e.g.
> someone (you?) verifies the results equal what you expect. Also, differences
> in the base kernel need to be tracked which might make adjustments of the
> cpufreq files / patch necessary.
> 
> > Such a script should be run daily (via cron) on ftp.linux.org.uk
> > 
> > This could perhaps work and provide up-to-date patches, as long as 2.4.x
> > cpufreq at http://ftp.linux.org.uk/pub/linux/cpufreq/ is kept up-to-date
> > with 2.6.x
> 
> But assuming that this CVS export is up-to-date [which it isn't], why is
> your script necessary?
> 
> > Perhaps patchin.sh should be modified in order to use cp (or mv) rather
> > than ln -s
> 
> Modifying the patchin.sh script to become more user friendly is something
> which can be done -- but _please_ be aware that 2.4. cpufreq is, at best, in
> "beta" state and not as up to date as 2.6.
> 

I can host this if that can help.  But do not expect though that such
patch will be updated so much though.

-- 
Bruno Ducrot

--  Which is worse:  ignorance or apathy?
--  Don't know.  Don't care.
