From: Ducrot Bruno <ducrot@poupinou.org>
Subject: [speedstep-piix4] regression testing needed.
Date: Fri, 11 Jul 2003 15:30:42 +0200
Sender: cpufreq-admin@www.linux.org.uk
Message-ID: <20030711133042.GC22636@poupinou.org>
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

I just commited a new version of speedstep-piix4.  I want
to know if this version have some kind of regression for
people.  Some people actually have a regression, in the
sense that the old, independant module found in
ftp://ftp.poupinou.org/dont_use/old/speedstep.tar.gz
does work, but do not work with the one in cpufreq.
(at least, there is 2 reports on this regression).

For those who want to test this one, but in a linux-2.4-ac
serie, then you can get the latest ac tree, plus the patch at
poupinou.org ftp site, then replace the speedstep-piix4.c
with the one from cvs trunk.  You have only to delete
one line:

static struct cpufreq_driver speedstep_driver = {
        .name           = "speedstep",
        .verify         = speedstep_verify,
        .target         = speedstep_target,
        .init           = speedstep_cpu_init,
        .owner          = THIS_MODULE,
        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
          to be deleted.
};

Thanks,

-- 
Ducrot Bruno

--  Which is worse:  ignorance or apathy?
--  Don't know.  Don't care.
