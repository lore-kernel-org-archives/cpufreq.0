From: Dave Jones <davej@redhat.com>
Subject: Re: longhaul: Unknown VIA CPU
Date: Wed, 3 Sep 2003 14:24:57 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20030903132457.GH1225@redhat.com>
References: <3F55187F.70707@free.fr> <1062596994.574.1.camel@sven>
	<20030903120038.GF1225@redhat.com>
	<20030903125204.GB4401@poupinou.org>
Mime-Version: 1.0
Return-path: <cpufreq-bounces@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20030903125204.GB4401@poupinou.org>
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

On Wed, Sep 03, 2003 at 02:52:04PM +0200, Ducrot Bruno wrote:
 > >  > also, the email
 > >  > address will need to be changed to the codemonkey one :)
 > > 
 > > Already fixed in 2.6, not sure about the 2.4/2.4-ac backports.
 > 
 > ducrot@neptune:~$ cvs rdiff -u -r LINUX_2_4 -rLINUX_2_5 cpufreq/linux/arch/i386/kernel/cpufreq/longhaul.c

I'm not sure if I pushed the changes back to CVS after merging to
2.5 mainline.

		Dave

-- 
 Dave Jones     http://www.codemonkey.org.uk
