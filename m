From: Ducrot Bruno <ducrot@poupinou.org>
Subject: [speedstep] speedstep-detect released or how to determine the gpo_hilo option.
Date: Thu, 19 Jun 2003 19:24:43 +0200
Sender: cpufreq-admin@www.linux.org.uk
Message-ID: <20030619172443.GW19556@poupinou.org>
Mime-Version: 1.0
Return-path: <cpufreq-admin@www.linux.org.uk>
Content-Disposition: inline
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
To: cpufreq@lists.arm.linux.org.uk

List,

I just finished a little tool so that now you
do not need no more to get the old kernel module at
<ftp://ftp.poupinou.org/dont_use/old/> in
order to determine what is the correct
gpo_hilo= kernel option for the PIIX4.

It can be found at
<ftp://ftp.poupinou.org/cpufreq/speedstep-detect.tar.gz>

<http://www.poupinou.org/cpufreq/>
is also updated as a consequence.

The speedstep-detect utility perform an int15 GSIC call,
in order to get a cpufreq speedstep-bios driver
more easy to be written.

Therefore, even if you have other southbridges other than the
PIIX4M as ICHxM for example, I will be happy to get 
the output of ./speedstep-detect.

Thanks,

-- 
Ducrot Bruno

--  Which is worse:  ignorance or apathy?
--  Don't know.  Don't care.
