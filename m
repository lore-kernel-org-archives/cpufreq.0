From: Ducrot Bruno <ducrot@poupinou.org>
Subject: Re: SpeedStep New Driver for Pentium III (-M) using SMI interface
Date: Tue, 2 Sep 2003 19:02:17 +0200
Sender: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Message-ID: <20030902170217.GT4401@poupinou.org>
References: <871xuzbycu.wl%miura@da-cha.org> <20030902083150.GA3958@brodo.de>
	<20030902123538.GR4401@poupinou.org>
	<20030902145452.GA8512@brodo.de>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20030902145452.GA8512@brodo.de>
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
To: Dominik Brodowski <linux@brodo.de>
Cc: Hiroshi Miura <miura@da-cha.org>, Ducrot Bruno <ducrot@arm.linux.org.uk>, cpufreq@www.linux.org.uk

On Tue, Sep 02, 2003 at 04:54:52PM +0200, Dominik Brodowski wrote:
> Fantastic, speedstep finally works on my notebook!!! Wow... Congratulations
> to Bruno Ducrot and Hiroshi Miura. 

Congratulations must go to Miura-san.  He was the one who find at last
the missing bits (the ownership call) for that work.

Still I am confused for the need to setup the esi to point
to a string.  That sound like at first as a strange way for obfuscating
things.
I really would like some comments from Intel.


-- 
Ducrot Bruno

--  Which is worse:  ignorance or apathy?
--  Don't know.  Don't care.
