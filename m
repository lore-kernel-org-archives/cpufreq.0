From: Ducrot Bruno <ducrot@poupinou.org>
Subject: Re: cpufreq and P3 speedstep with 2.6.0-test3 kernel
Date: Wed, 13 Aug 2003 17:03:57 +0200
Sender: cpufreq-admin@www.linux.org.uk
Message-ID: <20030813150357.GH1372@poupinou.org>
References: <20030813135836.GA28615@via.ecp.fr> <20030813140443.GE1372@poupinou.org> <20030813141141.GB28615@via.ecp.fr> <20030813143221.GF1372@poupinou.org> <20030813145631.GA28850@via.ecp.fr>
Mime-Version: 1.0
Return-path: <cpufreq-admin@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20030813145631.GA28850@via.ecp.fr>
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
To: Johan Bilien <jobi@via.ecp.fr>
Cc: cpufreq@www.linux.org.uk

On Wed, Aug 13, 2003 at 04:56:32PM +0200, Johan Bilien wrote:
> On Wed, Aug 13, 2003, Ducrot Bruno wrote:
> > Could you please read http://www.poupinou.org/cpufreq/
> > and:
> > 
> > ftp://ftp.poupinou.org/cpufreq/speedstep-detect.tar.gz
> > 
> > then give me output of ./speedstep-detect
> > both on battery and ac ?

Could you please retry, but with 'speedstep' turned off in bios?

Defining
#define SPEEDSTEP_DEBUG
in speedstep-lib.c and in speedstep-piix4.c will be also usefull.

Cheers,

-- 
Ducrot Bruno

--  Which is worse:  ignorance or apathy?
--  Don't know.  Don't care.
