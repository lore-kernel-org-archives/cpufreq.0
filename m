From: Alex Simonov <a_simonov@yahoo.com>
Subject: Re: Broken PST for Sony Vaio FX-502 with Athlon XP 1900+ fixed !
Date: Mon, 6 Oct 2003 08:37:29 -0700 (PDT)
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20031006153729.32725.qmail@web20806.mail.yahoo.com>
References: <20031001174844.GH11391@poupinou.org>
Mime-Version: 1.0
Return-path: <cpufreq-bounces@www.linux.org.uk>
In-Reply-To: <20031001174844.GH11391@poupinou.org>
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
To: Ducrot Bruno <ducrot@poupinou.org>
Cc: cpufreq@www.linux.org.uk


--- Ducrot Bruno <ducrot@poupinou.org> wrote:
> On Wed, Oct 01, 2003 at 07:13:13AM -0700, Alex
> Simonov wrote:
> 
> I think you can replace the powernow-k7.c of
> your kernel
> with the cvs version, without changing all.
> 
> There are not enough change in core (yet) with
> the one
> you have I guess.


Hi Bruno, 

Thank you very much for the advice. I took the
powernow-k7.c from the CVS, and compiled it with
my "fake" PST. I had to fix only the missing
define for the wrmsrl and rdmsrl symbols. So far
the powernow scaling for my XP 1900+ seems to
work. 
Just one question-the x86info utility displays
either "Voltage changes wont happen" or Frequency
changes wont happen" depending on that if you're
changing the speed up or down, because of the
CVID and CFID bits set to 0 in each change_fid or
change_vid function? Does this mean that VID/FID
is not changing? The MSR register values are set
anyway, is there any definitive way to make sure
if I have the correct voltage output?

Thank you very much,

Alex


__________________________________
Do you Yahoo!?
The New Yahoo! Shopping - with improved product search
http://shopping.yahoo.com
