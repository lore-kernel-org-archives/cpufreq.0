From: Ducrot Bruno <ducrot@poupinou.org>
Subject: Re: Broken PST for Sony Vaio FX-502 with Athlon XP 1900+ fixed !
Date: Tue, 30 Sep 2003 10:50:09 +0200
Sender: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Message-ID: <20030930085009.GY11391@poupinou.org>
References: <99F2150714F93F448942F9A9F112634C080EF0A6@txexmtae.amd.com>
	<20030929101002.13923.qmail@web20804.mail.yahoo.com>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20030929101002.13923.qmail@web20804.mail.yahoo.com>
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
To: Alex Simonov <a_simonov@yahoo.com>
Cc: cpufreq@www.linux.org.uk

On Mon, Sep 29, 2003 at 03:10:02AM -0700, Alex Simonov wrote:
> Hello guys,
> 
> Thanks to the all people, contributing to the
> CPUFREQ project, finally I have powernow working
> on my Vaio with upgraded Athlon 1900+ CPU! Thank
> you guys, you're great!
> 
> This weekend I installed the 2.4.22-10mdk
> Mandrake
> kernel on my Linux system, and spent some time
> tweaking the cpufreq driver. The problem was that
> there was no suitable for my CPU PST table in the
> BIOS. I modified a little bit the powernow-K7
> module to hardwire the FID and VID values (not
> forgetting to fix also the change_fid (VID) and
> change_VID (FID) bug, which for some reason the
> mandrake developers haven't fixed), and
> guess what-I got the powernow working! Below is
> the dmesg printout for the powernow module:

Warn: there are other bugs that you have to fix, or
any experiment with vid values will not work.

-- 
Ducrot Bruno

--  Which is worse:  ignorance or apathy?
--  Don't know.  Don't care.
